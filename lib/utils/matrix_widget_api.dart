// import 'dart:async';
// import 'dart:convert';
// import 'dart:ui';

// import 'package:matrix/matrix.dart';

// /// Implements the Matrix Widget API protocol (client side).
// ///
// /// This handles the communication between the host client (Extera) and an
// /// embedded widget (e.g. Element Call) via postMessage. The protocol is
// /// described in the Matrix Widget API RFC:
// /// https://docs.google.com/document/d/1uPF7XWY_dXTKVKV7jZQ2KmsI19wn9-kFRgQ1tFQP7wQ
// ///
// /// The widget sends `fromWidget` requests; the client responds and can also
// /// send `toWidget` requests.
// class MatrixWidgetApi {
//   final Client client;
//   final Room room;

//   /// The widget ID used in the protocol.
//   final String widgetId;

//   /// Callback to send a JSON message to the widget (postMessage).
//   final void Function(Map<String, dynamic> message) sendToWidget;

//   /// Called when the widget signals it wants to close / hang up.
//   final VoidCallback? onHangup;

//   /// Called when the widget has finished loading its content.
//   final VoidCallback? onContentLoaded;

//   /// The set of capabilities the widget has been granted.
//   /// By default we grant everything the widget requests.
//   Set<String> _grantedCapabilities = {};

//   /// Pending toWidget requests awaiting a response.
//   final Map<String, Completer<Map<String, dynamic>>> _pendingRequests = {};

//   /// Subscription for room timeline events to forward to the widget.
//   StreamSubscription? _timelineSubscription;

//   int _requestCounter = 0;

//   MatrixWidgetApi({
//     required this.client,
//     required this.room,
//     required this.widgetId,
//     required this.sendToWidget,
//     this.onHangup,
//     this.onContentLoaded,
//   });

//   /// Call this whenever a message is received from the widget.
//   void onMessage(Map<String, dynamic> message) {
//     final api = message['api'] as String?;

//     if (api == 'fromWidget') {
//       _handleFromWidget(message);
//     } else if (api == 'toWidget') {
//       // This is a response to a toWidget request we sent
//       _handleToWidgetResponse(message);
//     }
//   }

//   // -------------------------------------------------------------------------
//   // fromWidget request handling
//   // -------------------------------------------------------------------------

//   void _handleFromWidget(Map<String, dynamic> message) {
//     final action = message['action'] as String?;
//     final requestId = message['requestId'] as String?;
//     final data = message['data'] as Map<String, dynamic>? ?? {};

//     if (action == null || requestId == null) return;

//     switch (action) {
//       case 'content_loaded':
//         _handleContentLoaded(requestId);
//         break;
//       case 'supported_api_versions':
//         _handleSupportedApiVersions(requestId);
//         break;
//       case 'm.get_supported_api_versions':
//         _handleSupportedApiVersions(requestId);
//         break;
//       case 'get_openid':
//       case 'io.element.get_openid':
//         _handleGetOpenId(requestId);
//         break;
//       case 'send_event':
//       case 'io.element.send_event':
//         _handleSendEvent(requestId, data);
//         break;
//       case 'send_to_device':
//       case 'io.element.send_to_device':
//         _handleSendToDevice(requestId, data);
//         break;
//       case 'org.matrix.msc2876.read_events':
//       case 'read_events':
//         _handleReadEvents(requestId, data);
//         break;
//       case 'org.matrix.msc3819.read_to_device':
//       case 'read_to_device':
//         // We don't buffer to-device messages; respond with empty list
//         _respondToWidget(requestId, action, {});
//         break;
//       case 'io.element.join':
//         // Widget wants to join the room — already joined
//         _respondToWidget(requestId, action, {'roomId': room.id});
//         break;
//       case 'io.element.hangup':
//       case 'im.vector.hangup':
//       case 'hangup':
//       case 'io.element.close':
//       case 'close':
//         _respondToWidget(requestId, action, {});
//         onHangup?.call();
//         break;
//       case 'capabilities':
//       case 'request_capabilities':
//         _handleCapabilities(requestId, data);
//         break;
//       case 'org.matrix.msc2931.navigate':
//       case 'navigate':
//         // Acknowledge but don't navigate
//         _respondToWidget(requestId, action, {});
//         break;
//       case 'org.matrix.msc4039.delay_event':
//       case 'delay_event':
//         // Not supported yet
//         _respondToWidget(requestId, action, {});
//         break;
//       case 'org.matrix.msc4140.update_delayed_event':
//       case 'update_delayed_event':
//         // Not supported yet
//         _respondToWidget(requestId, action, {});
//         break;
//       default:
//         Logs().w('[WidgetAPI] Unknown fromWidget action: $action');
//         _respondToWidget(
//           requestId,
//           action,
//           {},
//           errorMessage: 'Unknown action: $action',
//         );
//         break;
//     }
//   }

//   void _handleContentLoaded(String requestId) {
//     _respondToWidget(requestId, 'content_loaded', {});
//     onContentLoaded?.call();

//     // Start forwarding timeline events to the widget
//     _startEventForwarding();
//   }

//   void _handleSupportedApiVersions(String requestId) {
//     _respondToWidget(requestId, 'supported_api_versions', {
//       'supported_versions': [
//         '0.0.1',
//         '0.0.2',
//         // MSC2762 - widget receiving events
//         'org.matrix.msc2762',
//         // MSC2871 - widget sending events
//         'org.matrix.msc2871',
//         // MSC3819 - to-device messages
//         'org.matrix.msc3819',
//         // MSC2876 - reading events
//         'org.matrix.msc2876',
//       ],
//     });
//   }

//   Future<void> _handleGetOpenId(String requestId) async {
//     try {
//       final token = await client.requestOpenIdToken(client.userID!, {});
//       _respondToWidget(requestId, 'get_openid', {
//         'state': 'allowed',
//         'access_token': token.accessToken,
//         'token_type': token.tokenType,
//         'matrix_server_name': token.matrixServerName,
//         'expires_in': token.expiresIn,
//       });
//     } catch (e) {
//       Logs().e('[WidgetAPI] Failed to get OpenID token', e);
//       _respondToWidget(requestId, 'get_openid', {'state': 'blocked'});
//     }
//   }

//   Future<void> _handleSendEvent(
//     String requestId,
//     Map<String, dynamic> data,
//   ) async {
//     try {
//       final type = data['type'] as String? ?? data['event_type'] as String?;
//       final stateKey = data['state_key'] as String?;
//       final content = data['content'] as Map<String, dynamic>? ?? {};

//       if (type == null) {
//         _respondToWidget(
//           requestId,
//           'send_event',
//           {},
//           errorMessage: 'Missing event type',
//         );
//         return;
//       }

//       String? eventId;
//       if (stateKey != null) {
//         eventId = await client.setRoomStateWithKey(
//           room.id,
//           type,
//           stateKey,
//           content,
//         );
//       } else {
//         eventId = await room.sendEvent(content, type: type);
//       }

//       _respondToWidget(requestId, 'send_event', {
//         'room_id': room.id,
//         'event_id': eventId,
//       });
//     } catch (e) {
//       Logs().e('[WidgetAPI] Failed to send event', e);
//       _respondToWidget(requestId, 'send_event', {}, errorMessage: e.toString());
//     }
//   }

//   Future<void> _handleSendToDevice(
//     String requestId,
//     Map<String, dynamic> data,
//   ) async {
//     try {
//       final type = data['type'] as String? ?? data['event_type'] as String?;
//       final messages = data['messages'] as Map<String, dynamic>? ?? {};
//       final encrypted = data['encrypted'] as bool? ?? false;

//       if (type == null) {
//         _respondToWidget(
//           requestId,
//           'send_to_device',
//           {},
//           errorMessage: 'Missing event type',
//         );
//         return;
//       }

//       if (encrypted) {
//         // Send encrypted to-device messages
//         for (final userId in messages.keys) {
//           final deviceMessages =
//               messages[userId] as Map<String, dynamic>? ?? {};
//           for (final deviceId in deviceMessages.keys) {
//             final content =
//                 deviceMessages[deviceId] as Map<String, dynamic>? ?? {};
//             await client.sendToDevice(
//               type,
//               client.generateUniqueTransactionId(),
//               {
//                 userId: {deviceId: content},
//               },
//             );
//           }
//         }
//       } else {
//         await client.sendToDevice(
//           type,
//           client.generateUniqueTransactionId(),
//           Map<String, Map<String, Map<String, dynamic>>>.from(
//             messages.map(
//               (userId, devices) => MapEntry(
//                 userId,
//                 Map<String, Map<String, dynamic>>.from(
//                   (devices as Map<String, dynamic>).map(
//                     (deviceId, content) => MapEntry(
//                       deviceId,
//                       Map<String, dynamic>.from(content as Map),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         );
//       }

//       _respondToWidget(requestId, 'send_to_device', {});
//     } catch (e) {
//       Logs().e('[WidgetAPI] Failed to send to-device message', e);
//       _respondToWidget(
//         requestId,
//         'send_to_device',
//         {},
//         errorMessage: e.toString(),
//       );
//     }
//   }

//   Future<void> _handleReadEvents(
//     String requestId,
//     Map<String, dynamic> data,
//   ) async {
//     try {
//       final type = data['type'] as String? ?? data['event_type'] as String?;
//       final stateKey = data['state_key'] as String?;
//       final limit = data['limit'] as int? ?? 25;

//       if (type == null) {
//         _respondToWidget(
//           requestId,
//           'read_events',
//           {},
//           errorMessage: 'Missing event type',
//         );
//         return;
//       }

//       List<Map<String, dynamic>> events = [];

//       if (stateKey != null) {
//         // Read state events
//         final stateEvents = room.states[type];
//         if (stateEvents != null) {
//           if (stateKey == '') {
//             // All state events of this type
//             events = stateEvents.values
//                 .map((e) => e.toJson())
//                 .take(limit)
//                 .toList();
//           } else {
//             final event = stateEvents[stateKey];
//             if (event != null) {
//               events = [event.toJson()];
//             }
//           }
//         }
//       } else {
//         // Read timeline events
//         final timeline = await room.getTimeline();
//         events = timeline.events
//             .where((e) => e.type == type)
//             .take(limit)
//             .map((e) => e.toJson())
//             .toList();
//       }

//       _respondToWidget(requestId, 'read_events', {'events': events});
//     } catch (e) {
//       Logs().e('[WidgetAPI] Failed to read events', e);
//       _respondToWidget(
//         requestId,
//         'read_events',
//         {},
//         errorMessage: e.toString(),
//       );
//     }
//   }

//   void _handleCapabilities(String requestId, Map<String, dynamic> data) {
//     // Grant all requested capabilities
//     final requested = data['capabilities'] as List<dynamic>? ?? [];
//     _grantedCapabilities = requested.map((e) => e.toString()).toSet();

//     _respondToWidget(requestId, 'capabilities', {
//       'capabilities': _grantedCapabilities.toList(),
//       'approved': true,
//     });
//   }

//   // -------------------------------------------------------------------------
//   // toWidget request sending
//   // -------------------------------------------------------------------------

//   /// Sends a toWidget request and returns the response.
//   Future<Map<String, dynamic>> sendToWidgetRequest(
//     String action,
//     Map<String, dynamic> data,
//   ) {
//     final requestId = 'toWidget_${_requestCounter++}';
//     final completer = Completer<Map<String, dynamic>>();
//     _pendingRequests[requestId] = completer;

//     sendToWidget({
//       'api': 'toWidget',
//       'action': action,
//       'requestId': requestId,
//       'widgetId': widgetId,
//       'data': data,
//     });

//     // Timeout after 30 seconds
//     return completer.future.timeout(
//       const Duration(seconds: 30),
//       onTimeout: () {
//         _pendingRequests.remove(requestId);
//         return {'error': 'Timeout'};
//       },
//     );
//   }

//   void _handleToWidgetResponse(Map<String, dynamic> message) {
//     final requestId = message['requestId'] as String?;
//     if (requestId == null) return;

//     final completer = _pendingRequests.remove(requestId);
//     if (completer != null && !completer.isCompleted) {
//       completer.complete(message['response'] as Map<String, dynamic>? ?? {});
//     }
//   }

//   /// Sends a `notify_capabilities` toWidget action.
//   Future<void> notifyCapabilities() async {
//     await sendToWidgetRequest('notify_capabilities', {
//       'requested': _grantedCapabilities.toList(),
//       'approved': _grantedCapabilities.toList(),
//     });
//   }

//   /// Sends a room event to the widget via `send_event` toWidget action.
//   void _forwardEventToWidget(Event event) {
//     sendToWidget({
//       'api': 'toWidget',
//       'action': 'send_event',
//       'requestId': 'toWidget_event_${_requestCounter++}',
//       'widgetId': widgetId,
//       'data': event.toJson(),
//     });
//   }

//   /// Sends a to-device event to the widget.
//   void forwardToDeviceEvent(String type, Map<String, dynamic> content) {
//     sendToWidget({
//       'api': 'toWidget',
//       'action': 'send_to_device',
//       'requestId': 'toWidget_todevice_${_requestCounter++}',
//       'widgetId': widgetId,
//       'data': {'type': type, 'content': content, 'sender': client.userID},
//     });
//   }

//   // -------------------------------------------------------------------------
//   // Event forwarding
//   // -------------------------------------------------------------------------

//   void _startEventForwarding() {
//     _timelineSubscription?.cancel();
//     _timelineSubscription = client.onTimelineEvent.stream.listen((update) {
//       if (update.roomId == room.id) {
//         _forwardEventToWidget(update);
//       }
//     });
//   }

//   // -------------------------------------------------------------------------
//   // Respond helper
//   // -------------------------------------------------------------------------

//   void _respondToWidget(
//     String requestId,
//     String action,
//     Map<String, dynamic> responseData, {
//     String? errorMessage,
//   }) {
//     final response = <String, dynamic>{
//       'api': 'fromWidget',
//       'action': action,
//       'requestId': requestId,
//       'widgetId': widgetId,
//       'response': responseData,
//     };

//     if (errorMessage != null) {
//       response['response'] = {
//         ...responseData,
//         'error': {'message': errorMessage},
//       };
//     }

//     sendToWidget(response);
//   }

//   // -------------------------------------------------------------------------
//   // Lifecycle
//   // -------------------------------------------------------------------------

//   /// Disposes the API handler and stops event forwarding.
//   void dispose() {
//     _timelineSubscription?.cancel();
//     for (final completer in _pendingRequests.values) {
//       if (!completer.isCompleted) {
//         completer.complete({'error': 'disposed'});
//       }
//     }
//     _pendingRequests.clear();
//   }
// }
