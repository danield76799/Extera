import 'dart:async';

import 'package:flutter/material.dart';

import 'package:matrix/matrix.dart';

import 'package:Pulsly/pages/chat_search/chat_search_view.dart';
import 'package:Pulsly/widgets/matrix.dart';

class ChatSearchPage extends StatefulWidget {
  final String roomId;
  const ChatSearchPage({required this.roomId, super.key});

  @override
  ChatSearchController createState() => ChatSearchController();
}

class ChatSearchController extends State<ChatSearchPage>
    with SingleTickerProviderStateMixin {
  Room? get room => Matrix.of(context).client.getRoomById(widget.roomId);

  final TextEditingController searchController = TextEditingController();
  late final TabController tabController;

  Timeline? timeline;

  Stream<(List<Event>, String?)>? searchStream;
  Stream<(List<Event>, String?)>? galleryStream;
  Stream<(List<Event>, String?)>? fileStream;

  // Search filters
  String? filterSenderId;
  DateTime? filterFromDate;
  DateTime? filterToDate;

  List<Event> _applyFilters(List<Event> events) {
    return events.where((event) {
      if (filterSenderId != null && event.senderId != filterSenderId)
        return false;
      if (filterFromDate != null &&
          event.originServerTs.isBefore(filterFromDate!))
        return false;
      if (filterToDate != null && event.originServerTs.isAfter(filterToDate!))
        return false;
      return true;
    }).toList();
  }

  List<Event> _applyTextFilter(List<Event> events, String query) {
    if (query.isEmpty) return events;
    final lower = query.toLowerCase();
    return events.where((e) {
      final body = e.body.toLowerCase();
      final filename = e.content.tryGet<String>('filename') ?? '';
      return body.contains(lower) || filename.toLowerCase().contains(lower);
    }).toList();
  }

  void restartSearch() {
    if (searchController.text.isEmpty) {
      setState(() {
        searchStream = null;
        timeline = null; // Clear cache for fresh search
      });
      return;
    }
    setState(() {
      searchStream = const Stream.empty();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startMessageSearch();
    });
  }

  void startMessageSearch({
    String? prevBatch,
    List<Event>? previousSearchResult,
  }) async {
    final timeline = this.timeline ??= await room!.getTimeline();

    if (tabController.index == 0 && searchController.text.isEmpty) {
      return;
    }

    setState(() {
      searchStream = timeline
          .startSearch(
            searchTerm: searchController.text,
            prevBatch: prevBatch,
            requestHistoryCount: 200,
            limit: 50,
          )
          .map((result) {
            var events = result.$1;
            // Only filter new events, not all previous results
            if (searchController.text.isNotEmpty) {
              events = _applyTextFilter(events, searchController.text);
            }
            events = _applyFilters(events);
            return (
              [
                if (previousSearchResult != null) ...previousSearchResult,
                ...events,
              ],
              result.$2,
            );
          })
          .asBroadcastStream();
    });
  }

  void startGallerySearch({
    String? prevBatch,
    List<Event>? previousSearchResult,
  }) async {
    final timeline = this.timeline ??= await room!.getTimeline();

    setState(() {
      galleryStream = timeline
          .startSearch(
            searchFunc: (event) => {
              MessageTypes.Image,
              MessageTypes.Video,
            }.contains(event.messageType),
            prevBatch: prevBatch,
            requestHistoryCount: 1000,
            limit: 32,
          )
          .map((result) {
            var events = result.$1;
            if (searchController.text.isNotEmpty) {
              events = _applyTextFilter(events, searchController.text);
            }
            events = _applyFilters(events);
            return (
              [
                if (previousSearchResult != null) ...previousSearchResult,
                ...events,
              ],
              result.$2,
            );
          })
          .asBroadcastStream();
    });
  }

  void startFileSearch({
    String? prevBatch,
    List<Event>? previousSearchResult,
  }) async {
    final timeline = this.timeline ??= await room!.getTimeline();

    setState(() {
      fileStream = timeline
          .startSearch(
            searchFunc: (event) =>
                event.messageType == MessageTypes.File ||
                (event.messageType == MessageTypes.Audio &&
                    !event.content.containsKey('org.matrix.msc3245.voice')),
            prevBatch: prevBatch,
            requestHistoryCount: 1000,
            limit: 32,
          )
          .map((result) {
            var events = result.$1;
            if (searchController.text.isNotEmpty) {
              events = _applyTextFilter(events, searchController.text);
            }
            events = _applyFilters(events);
            return (
              [
                if (previousSearchResult != null) ...previousSearchResult,
                ...events,
              ],
              result.$2,
            );
          })
          .asBroadcastStream();
    });
  }

  void _onTabChanged() {
    switch (tabController.index) {
      case 1:
        startGallerySearch();
        break;
      case 2:
        startFileSearch();
        break;
      default:
        restartSearch();
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    tabController.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    tabController.removeListener(_onTabChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ChatSearchView(this);
}
