import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:matrix/matrix.dart';
import 'package:extera_next/config/themes.dart';
import 'package:extera_next/utils/client_download_content_extension.dart';
import 'package:extera_next/utils/matrix_sdk_extensions/matrix_file_extension.dart';
import 'package:extera_next/widgets/matrix.dart';

class MxcImage extends StatefulWidget {
  final Uri? uri;
  final Event? event;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool isThumbnail;
  final bool animated;
  final Duration retryDuration;
  final Duration animationDuration;
  final Curve animationCurve;
  final ThumbnailMethod thumbnailMethod;
  final Widget Function(BuildContext context)? placeholder;
  final String? cacheKey;
  final Client? client;
  final BorderRadius borderRadius;

  const MxcImage({
    this.uri,
    this.event,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.isThumbnail = true,
    this.animated = false,
    this.animationDuration = FluffyThemes.animationDuration,
    this.retryDuration = const Duration(seconds: 2),
    this.animationCurve = FluffyThemes.animationCurve,
    this.thumbnailMethod = ThumbnailMethod.scale,
    this.cacheKey,
    this.client,
    this.borderRadius = BorderRadius.zero,
    super.key,
  });

  @override
  State<MxcImage> createState() => _MxcImageState();
}

class _MxcImageState extends State<MxcImage> {
  // Static cache to hold bytes in memory across widget rebuilds
  static final Map<String, Uint8List> _imageDataCache = {};

  Uint8List? _currentData;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // OPTIMIZATION: Check cache synchronously.
    // This is safe because _getFromCache does NOT use context/MediaQuery.
    // If data is there, render it on Frame 1.
    _currentData = _getFromCache();
    
    // REMOVED: _load() call from here. 
    // It requires MediaQuery, so we move it to didChangeDependencies.
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // This method is called immediately after initState and whenever
    // dependencies (like MediaQuery or Matrix.of) change.
    
    // Only load if we don't have data and aren't already loading.
    if (_currentData == null && !_isLoading) {
      _load();
    }
  }

  @override
  void didUpdateWidget(MxcImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    // OPTIMIZATION: Only reload if the source actually changed.
    if (oldWidget.uri != widget.uri ||
        oldWidget.event != widget.event ||
        oldWidget.cacheKey != widget.cacheKey) {
      
      final cached = _getFromCache();
      
      if (cached != null) {
        setState(() {
          _currentData = cached;
          _isLoading = false;
        });
      } else {
        setState(() {
          _currentData = null;
          // We can set _isLoading to false here to ensure _load triggers
          _isLoading = false; 
        });
        // We can call _load here safely because context is available 
        // in didUpdateWidget
        _load(); 
      }
    }
  }

  Uint8List? _getFromCache() {
    if (widget.cacheKey != null) {
      return _imageDataCache[widget.cacheKey];
    }
    return null;
  }

  void _saveToCache(Uint8List data) {
    if (widget.cacheKey != null) {
      _imageDataCache[widget.cacheKey!] = data;
    }
  }

  Future<void> _load() async {
    // Safety check: Ensure we don't load if already loading 
    // (unless forced by update) or if unmounted
    if (_isLoading || !mounted) return;
    
    setState(() {
      _isLoading = true;
    });

    try {
      // Matrix.of(context) requires context, safe now in didChangeDependencies
      final client =
          widget.client ??
          widget.event?.room.client ??
          Matrix.of(context).client;
          
      final uri = widget.uri;
      final event = widget.event;
      Uint8List? loadedBytes;

      if (uri != null) {
        // MediaQuery.devicePixelRatioOf requires context, safe now
        final devicePixelRatio = MediaQuery.devicePixelRatioOf(context);
        
        final realWidth = widget.width != null
            ? widget.width! * devicePixelRatio
            : null;
        final realHeight = widget.height != null
            ? widget.height! * devicePixelRatio
            : null;

        loadedBytes = await client.downloadMxcCached(
          uri,
          width: realWidth,
          height: realHeight,
          thumbnailMethod: widget.thumbnailMethod,
          isThumbnail: widget.isThumbnail,
          animated: widget.animated,
        );
      } else if (event != null) {
        final data = await event.downloadAndDecryptAttachment(
          getThumbnail: widget.isThumbnail,
        );
        if (data.detectFileType is MatrixImageFile) {
          loadedBytes = data.bytes;
        }
      }

      if (!mounted) return;

      if (loadedBytes != null && loadedBytes.isNotEmpty) {
        _saveToCache(loadedBytes);
        setState(() {
          _currentData = loadedBytes;
          _isLoading = false;
        });
      } else {
        _scheduleRetry();
      }
    } on IOException catch (_) {
      _scheduleRetry();
    } catch (e, s) {
      Logs().d('Unexpected error loading mxc image', e, s);
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _scheduleRetry() {
    if (!mounted) return;
    
    // Mark as not loading so retry can fire
    setState(() => _isLoading = false);
    
    Future.delayed(widget.retryDuration, () {
      if (mounted && _currentData == null) {
         _load();
      }
    });
  }

  Widget _buildPlaceholder(BuildContext context) =>
      widget.placeholder?.call(context) ??
      SizedBox(
        width: widget.width,
        height: widget.height,
        child: const Center(
          child: CircularProgressIndicator.adaptive(strokeWidth: 2),
        ),
      );

  Widget _buildError(BuildContext context) => SizedBox(
    width: widget.width,
    height: widget.height,
    child: Material(
      color: Theme.of(context).colorScheme.surfaceContainer,
      child: Icon(
        Icons.broken_image_outlined,
        size: min(widget.height ?? 64, 64),
        color: Theme.of(context).colorScheme.onSurface,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final data = _currentData;

    if (data == null || data.isEmpty) {
      return KeyedSubtree(
        key: const ValueKey('placeholder'),
        child: _buildPlaceholder(context),
      );
    }

    final imageWidget = Image.memory(
      data,
      width: widget.width,
      height: widget.height,
      fit: widget.fit,
      gaplessPlayback: true,
      filterQuality: widget.isThumbnail
          ? FilterQuality.low
          : FilterQuality.medium,
      errorBuilder: (context, e, s) {
        Logs().d('Unable to render mxc image bytes', e, s);
        return _buildError(context);
      },
    );

    if (widget.borderRadius == BorderRadius.zero) {
      return imageWidget;
    }

    return ClipRRect(
      key: ValueKey(widget.cacheKey ?? widget.uri),
      borderRadius: widget.borderRadius,
      child: imageWidget,
    );
  }
}