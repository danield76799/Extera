import 'package:flutter/material.dart';

import 'package:matrix/matrix.dart';

import 'package:extera_next/config/app_config.dart';
import 'package:extera_next/generated/l10n/l10n.dart';
import 'package:extera_next/utils/matrix_sdk_extensions/favourite_stickers_extension.dart';
import 'package:extera_next/utils/matrix_sdk_extensions/recent_stickers_extension.dart';
import 'package:extera_next/widgets/mxc_image.dart';
import '../../widgets/avatar.dart';

class StickerPickerDialog extends StatefulWidget {
  final Room room;
  final void Function(ImagePackImageContent) onSelected;

  const StickerPickerDialog({
    required this.onSelected,
    required this.room,
    super.key,
  });

  @override
  StickerPickerDialogState createState() => StickerPickerDialogState();
}

class StickerPickerDialogState extends State<StickerPickerDialog> {
  String? searchFilter;
  final ScrollController _scrollController = ScrollController();
  String? _activePackId;

  Map<String, ImagePackContent> stickerPacks = {};
  List<ImagePackImageContent> recentStickers = [];
  List<ImagePackImageContent> favouriteStickers = [];

  // Grid layout constants — must match the SliverGridDelegate used below.
  static const double _maxCrossAxisExtent = 84;
  static const double _gridMainAxisSpacing = 8.0;
  static const double _gridCrossAxisSpacing = 8.0;

  // Heights for non-grid elements
  static const double _listTileHeight = 56.0; // Material ListTile default
  static const double _sectionGapHeight = 20.0;
  static const double _postHeaderGap = 6.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    final client = widget.room.client;
    stickerPacks = widget.room.getImagePacks(.sticker);

    recentStickers = client.recentStickers;
    favouriteStickers = client.favouriteStickers;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Offset calculation helpers
  // ---------------------------------------------------------------------------

  /// Number of columns that fit in the given [width].
  int _crossAxisCount(double width) {
    // Mirrors SliverGridDelegateWithMaxCrossAxisExtent logic.
    return (width / (_maxCrossAxisExtent + _gridCrossAxisSpacing)).ceil().clamp(
      1,
      100,
    );
  }

  /// Total height of a grid with [itemCount] items at the given [width].
  double _gridHeight(int itemCount, double width) {
    if (itemCount == 0) return 0;
    final cols = _crossAxisCount(width);
    final rows = (itemCount / cols).ceil();
    // Each cell is square with side = crossAxisExtent (derived from delegate).
    // The actual cell extent depends on available width:
    final usableCrossAxis = width - (cols - 1) * _gridCrossAxisSpacing;
    final cellExtent = usableCrossAxis / cols;
    return rows * cellExtent + (rows - 1) * _gridMainAxisSpacing;
  }

  /// Builds a list of (_SectionInfo) describing each logical section
  /// (favourites, recents, each pack) and its scroll offset.
  List<_SectionInfo> _buildSections(double width) {
    final sections = <_SectionInfo>[];
    double offset = 0;

    final hasRecentStickers =
        recentStickers.isNotEmpty && !(searchFilter?.isNotEmpty ?? false);
    final hasFavouriteStickers =
        favouriteStickers.isNotEmpty && !(searchFilter?.isNotEmpty ?? false);

    if (hasFavouriteStickers) {
      final sectionStart = offset;
      // header
      offset += _listTileHeight + _postHeaderGap;
      // grid
      offset += _gridHeight(favouriteStickers.length, width);
      sections.add(
        _SectionInfo(
          id: '_favourite',
          offset: sectionStart,
          height: offset - sectionStart,
        ),
      );
    }

    if (hasRecentStickers) {
      final sectionStart = offset;
      offset += _listTileHeight + _postHeaderGap;
      offset += _gridHeight(recentStickers.length, width);
      sections.add(
        _SectionInfo(
          id: '_recent',
          offset: sectionStart,
          height: offset - sectionStart,
        ),
      );
    }

    final packSlugs = stickerPacks.keys.toList();
    for (var i = 0; i < packSlugs.length; i++) {
      final slug = packSlugs[i];
      final pack = stickerPacks[slug]!;

      final filtered = _filteredImageKeys(pack);
      if (filtered.isEmpty) continue;

      final sectionStart = offset;
      // gap before pack (if not the very first visible section)
      if (sections.isNotEmpty) {
        offset += _sectionGapHeight;
      }
      // header
      final packName = pack.pack.displayName ?? slug;
      if (packName != 'user') {
        offset += _listTileHeight;
      }
      offset += _postHeaderGap;
      // grid
      offset += _gridHeight(filtered.length, width);
      sections.add(
        _SectionInfo(
          id: slug,
          offset: sectionStart,
          height: offset - sectionStart,
        ),
      );
    }

    return sections;
  }

  List<String> _filteredImageKeys(ImagePackContent pack) {
    final entries = pack.images.entries.toList();
    if (searchFilter?.isNotEmpty ?? false) {
      entries.removeWhere(
        (e) =>
            !(e.key.toLowerCase().contains(searchFilter!.toLowerCase()) ||
                (e.value.body?.toLowerCase().contains(
                      searchFilter!.toLowerCase(),
                    ) ??
                    false)),
      );
    }
    return entries.map((e) => e.key).toList();
  }

  // ---------------------------------------------------------------------------
  // Scroll handling
  // ---------------------------------------------------------------------------

  void _onScroll() {
    final width = context.size?.width;
    if (width == null || width == 0) return;

    final sections = _buildSections(width);
    if (sections.isEmpty) return;

    final scrollOffset = _scrollController.offset;
    String? newActiveId;

    // The active section is the last one whose offset we've scrolled past
    // (with a small threshold so it flips early).
    for (final section in sections) {
      if (scrollOffset >= section.offset - 40) {
        newActiveId = section.id;
      }
    }

    if (newActiveId != _activePackId) {
      setState(() {
        _activePackId = newActiveId;
      });
    }
  }

  void _scrollToSection(String sectionId) {
    final width = context.size?.width;
    if (width == null || width == 0) return;

    final sections = _buildSections(width);
    final section = sections.where((s) => s.id == sectionId).firstOrNull;
    if (section == null) return;

    final target = section.offset.clamp(
      0.0,
      _scrollController.position.maxScrollExtent,
    );

    _scrollController.animateTo(
      target,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // ---------------------------------------------------------------------------
  // Sticker interactions
  // ---------------------------------------------------------------------------

  void _onStickerSelected(ImagePackImageContent sticker) {
    widget.room.client.addRecentSticker(sticker);
    widget.onSelected(sticker);
  }

  void _showStickerInfoDialog({
    required ImagePackImageContent sticker,
    String? packName,
    String? packAttribution,
    bool isFromRecents = false,
  }) {
    final client = widget.room.client;
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            var isFavourite = client.isFavouriteSticker(sticker);
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MxcImage(
                    uri: sticker.url,
                    isThumbnail: false,
                    width: 384,
                    fit: BoxFit.contain,
                    animated: true,
                  ),
                  const SizedBox(height: 16),
                  if (sticker.body != null && sticker.body!.isNotEmpty)
                    Text(
                      sticker.body!,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  if (packName != null && packName.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      packName,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                  if (packAttribution != null &&
                      packAttribution.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      packAttribution,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                  Material(
                    color: Theme.of(context).colorScheme.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(AppConfig.borderRadius),
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.send_outlined),
                          title: Text(L10n.of(context).sendSticker),
                          onTap: () async {
                            _onStickerSelected(sticker);
                            setDialogState(() {});
                            setState(() {});
                            if (mounted) {
                              Navigator.of(context, rootNavigator: false).pop();
                            }
                          },
                        ),
                        ListTile(
                          leading: Icon(
                            isFavourite ? Icons.star : Icons.star_border,
                          ),
                          title: Text(
                            isFavourite
                                ? L10n.of(context).removeFromFavourites
                                : L10n.of(context).addToFavourites,
                          ),
                          onTap: () async {
                            if (isFavourite) {
                              await client.removeFavouriteSticker(sticker);
                            } else {
                              await client.addFavouriteSticker(sticker);
                            }
                            setDialogState(() {});
                            setState(() {
                              isFavourite = !isFavourite;
                            });
                          },
                        ),
                        if (isFromRecents)
                          ListTile(
                            iconColor: Theme.of(context).colorScheme.error,
                            leading: const Icon(Icons.delete_outline),
                            title: Text(
                              L10n.of(context).removeFromRecents,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.error,
                              ),
                            ),
                            onTap: () async {
                              await client.removeRecentSticker(sticker);
                              setState(() {});
                              Navigator.of(dialogContext).pop();
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // ---------------------------------------------------------------------------
  // Sliver builders
  // ---------------------------------------------------------------------------

  /// Builds a SliverGrid for a list of stickers (favourites / recents).
  Widget _buildStickerSliverGrid(
    List<ImagePackImageContent> stickers, {
    bool isFromRecents = false,
  }) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: _maxCrossAxisExtent,
        mainAxisSpacing: _gridMainAxisSpacing,
        crossAxisSpacing: _gridCrossAxisSpacing,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        final image = stickers[index];
        return _StickerTile(
          image: image,
          tooltip: image.body ?? '',
          onTap: () {
            final imageCopy = ImagePackImageContent.fromJson(
              image.toJson().copy(),
            );
            _onStickerSelected(imageCopy);
          },
          onLongPress: () {
            _showStickerInfoDialog(
              sticker: image,
              isFromRecents: isFromRecents,
            );
          },
        );
      }, childCount: stickers.length),
    );
  }

  /// Builds slivers for a single sticker pack (header + grid).
  List<Widget> _buildPackSlivers({
    required ImagePackContent pack,
    required String slug,
    required bool showGap,
  }) {
    final imageKeys = _filteredImageKeys(pack);
    if (imageKeys.isEmpty) return const [];

    final packName = pack.pack.displayName ?? slug;
    final slivers = <Widget>[];

    if (showGap) {
      slivers.add(
        const SliverToBoxAdapter(child: SizedBox(height: _sectionGapHeight)),
      );
    }

    if (packName != 'user') {
      slivers.add(
        SliverToBoxAdapter(
          child: ListTile(
            leading: Avatar(
              mxContent: pack.pack.avatarUrl,
              name: packName,
              client: widget.room.client,
            ),
            title: Text(packName),
          ),
        ),
      );
    }

    slivers.add(
      const SliverToBoxAdapter(child: SizedBox(height: _postHeaderGap)),
    );

    slivers.add(
      SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: _maxCrossAxisExtent,
          mainAxisSpacing: _gridMainAxisSpacing,
          crossAxisSpacing: _gridCrossAxisSpacing,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          final key = imageKeys[index];
          final image = pack.images[key]!;
          return _StickerTile(
            image: image,
            tooltip: image.body ?? key,
            onTap: () {
              final imageCopy = ImagePackImageContent.fromJson(
                image.toJson().copy(),
              );
              imageCopy.body ??= key;
              _onStickerSelected(imageCopy);
            },
            onLongPress: () {
              final stickerCopy = ImagePackImageContent.fromJson(
                image.toJson().copy(),
              );
              stickerCopy.body ??= key;
              _showStickerInfoDialog(
                sticker: stickerCopy,
                packName: pack.pack.displayName ?? slug,
                packAttribution: pack.pack.attribution,
              );
            },
          );
        }, childCount: imageKeys.length),
      ),
    );

    return slivers;
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final packSlugs = stickerPacks.keys.toList();

    final hasRecentStickers =
        recentStickers.isNotEmpty && !(searchFilter?.isNotEmpty ?? false);

    final hasFavouriteStickers =
        favouriteStickers.isNotEmpty && !(searchFilter?.isNotEmpty ?? false);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                height: 40,
                child: TextField(
                  autofocus: false,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: L10n.of(context).search,
                    prefixIcon: const Icon(Icons.search, size: 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  onChanged: (s) => setState(() => searchFilter = s),
                ),
              ),
            ),
            // Sticky horizontal pack selector
            Container(
              color: Colors.transparent,
              height: 57,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const SizedBox(width: 4),
                          if (hasFavouriteStickers)
                            _PackTabItem(
                              onTap: () => _scrollToSection('_favourite'),
                              isActive: _activePackId == '_favourite',
                              child: const Icon(Icons.star, size: 28),
                            ),
                          if (hasRecentStickers)
                            _PackTabItem(
                              onTap: () => _scrollToSection('_recent'),
                              isActive: _activePackId == '_recent',
                              child: const Icon(Icons.history, size: 28),
                            ),
                          for (final slug in packSlugs)
                            Builder(
                              builder: (context) {
                                final pack = stickerPacks[slug]!;
                                final firstImage = pack.images.values.isNotEmpty
                                    ? pack.images.values.first
                                    : null;
                                return _PackTabItem(
                                  onTap: () => _scrollToSection(slug),
                                  isActive: _activePackId == slug,
                                  child: firstImage != null
                                      ? MxcImage(
                                          uri: firstImage.url,
                                          width: 36,
                                          height: 36,
                                          fit: BoxFit.contain,
                                          isThumbnail: true,
                                        )
                                      : const Icon(Icons.image, size: 28),
                                );
                              },
                            ),
                          const SizedBox(width: 4),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 1, thickness: 1),
                ],
              ),
            ),
            // Main sticker grid area — fully virtualized
            Expanded(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: <Widget>[
                  // Favourites section
                  if (hasFavouriteStickers) ...[
                    SliverToBoxAdapter(
                      child: ListTile(
                        leading: const Icon(Icons.star),
                        title: Text(L10n.of(context).favouriteStickers),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: _postHeaderGap),
                    ),
                    _buildStickerSliverGrid(
                      favouriteStickers,
                      isFromRecents: false,
                    ),
                  ],

                  // Recents section
                  if (hasRecentStickers) ...[
                    SliverToBoxAdapter(
                      child: ListTile(
                        leading: const Icon(Icons.history),
                        title: Text(L10n.of(context).recentStickers),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: _postHeaderGap),
                    ),
                    _buildStickerSliverGrid(
                      recentStickers,
                      isFromRecents: true,
                    ),
                  ],

                  // Empty state
                  if (packSlugs.isEmpty &&
                      !hasRecentStickers &&
                      !hasFavouriteStickers)
                    SliverFillRemaining(
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [Text(L10n.of(context).noEmotesFound)],
                        ),
                      ),
                    )
                  else
                    // Pack sections
                    for (int i = 0; i < packSlugs.length; i++)
                      ..._buildPackSlivers(
                        pack: stickerPacks[packSlugs[i]]!,
                        slug: packSlugs[i],
                        showGap:
                            i > 0 || hasRecentStickers || hasFavouriteStickers,
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Helper classes
// ---------------------------------------------------------------------------

/// Describes a logical section's position in the scroll view.
class _SectionInfo {
  final String id;
  final double offset;
  final double height;

  const _SectionInfo({
    required this.id,
    required this.offset,
    required this.height,
  });
}

/// A single sticker tile used inside grids.
class _StickerTile extends StatelessWidget {
  final ImagePackImageContent image;
  final String tooltip;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const _StickerTile({
    required this.image,
    required this.tooltip,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        radius: AppConfig.borderRadius,
        key: ValueKey(image.url.toString()),
        onTap: onTap,
        onLongPress: onLongPress,
        child: AbsorbPointer(
          absorbing: true,
          child: MxcImage(
            uri: image.url,
            fit: BoxFit.contain,
            width: 128,
            height: 128,
            animated: true,
            isThumbnail: false,
          ),
        ),
      ),
    );
  }
}

/// A single tab item in the pack selector bar.
class _PackTabItem extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;
  final bool isActive;

  const _PackTabItem({
    required this.onTap,
    required this.child,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? theme.colorScheme.primary : Colors.transparent,
              width: 3,
            ),
          ),
        ),
        child: SizedBox(width: 40, height: 36, child: Center(child: child)),
      ),
    );
  }
}
