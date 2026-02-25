// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// import 'package:matrix/matrix.dart';
// import 'package:universal_html/html.dart' as html;
// import 'package:webview_flutter/webview_flutter.dart';

// import 'package:extera_next/utils/matrix_widget_api.dart';
// import 'package:extera_next/utils/platform_infos.dart';

// /// A reusable WebView widget that implements the Matrix Widget API.
// ///
// /// This widget loads a URL in a WebView (mobile) or iframe (web) and
// /// bridges postMessage communication with [MatrixWidgetApi] to handle
// /// the client↔widget protocol described in the Matrix Widget API RFC.
// ///
// /// Usage:
// /// ```dart
// /// WidgetWebView(
// ///   client: client,
// ///   room: room,
// ///   widgetId: 'my-widget-id',
// ///   url: Uri.parse('https://...'),
// ///   onHangup: () { /* handle close */ },
// /// )
// /// ```
// class WidgetWebView extends StatefulWidget {
//   /// The Matrix client for API calls.
//   final Client client;

//   /// The room this widget is associated with.
//   final Room room;

//   /// A unique identifier for this widget instance.
//   final String widgetId;

//   /// The URL to load in the webview.
//   final Uri url;

//   /// Called when the widget signals it wants to close / hang up.
//   final VoidCallback? onHangup;

//   /// Called when the widget has finished loading its content.
//   final VoidCallback? onContentLoaded;

//   const WidgetWebView({
//     super.key,
//     required this.client,
//     required this.room,
//     required this.widgetId,
//     required this.url,
//     this.onHangup,
//     this.onContentLoaded,
//   });

//   @override
//   State<WidgetWebView> createState() => WidgetWebViewState();
// }

// class WidgetWebViewState extends State<WidgetWebView> {
//   MatrixWidgetApi? _widgetApi;
//   WebViewController? _webViewController;
//   String? _iframeViewType;

//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }

//   void _init() {
//     if (kIsWeb) {
//       _initWeb();
//     } else if (PlatformInfos.isMobile) {
//       _initMobile();
//     }
//     // Desktop: no webview support, caller should handle fallback
//   }

//   // -------------------------------------------------------------------------
//   // Mobile (webview_flutter)
//   // -------------------------------------------------------------------------

//   void _initMobile() {
//     _webViewController = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onPageFinished: (_) {
//             // Inject the postMessage bridge script.
//             // This intercepts window.postMessage calls from the widget
//             // and forwards them to our Flutter JavaScript channel.
//             // It also exposes a function the client can call to send
//             // messages back to the widget.
//             _webViewController?.runJavaScript('''
//               // Bridge: widget -> client
//               window.addEventListener('message', function(event) {
//                 if (event.data) {
//                   try {
//                     var data = typeof event.data === 'string'
//                         ? event.data
//                         : JSON.stringify(event.data);
//                     if (window.WidgetApiChannel) {
//                       WidgetApiChannel.postMessage(data);
//                     }
//                   } catch(e) {
//                     console.error('[WidgetWebView] bridge error:', e);
//                   }
//                 }
//               });
//             ''');
//           },
//           onWebResourceError: (error) {
//             Logs().e(
//               '[WidgetWebView] WebView error: ${error.description}',
//             );
//           },
//         ),
//       )
//       ..addJavaScriptChannel(
//         'WidgetApiChannel',
//         onMessageReceived: (message) {
//           _onRawMessage(message.message);
//         },
//       );

//     // Create the Widget API with a sender that posts messages back to the
//     // webview via JavaScript.
//     _widgetApi = MatrixWidgetApi(
//       client: widget.client,
//       room: widget.room,
//       widgetId: widget.widgetId,
//       sendToWidget: _sendToMobileWebView,
//       onHangup: widget.onHangup,
//       onContentLoaded: widget.onContentLoaded,
//     );

//     _webViewController!.loadRequest(widget.url);
//   }

//   /// Sends a JSON message to the widget running in the mobile webview.
//   void _sendToMobileWebView(Map<String, dynamic> message) {
//     final json = jsonEncode(message);
//     // Use postMessage to send to the widget's window
//     _webViewController?.runJavaScript(
//       'window.postMessage($json, "*");',
//     );
//   }

//   // -------------------------------------------------------------------------
//   // Web (iframe via HtmlElementView)
//   // -------------------------------------------------------------------------

//   void _initWeb() {
//     _iframeViewType =
//         'widget-webview-${widget.widgetId}-${DateTime.now().millisecondsSinceEpoch}';

//     _widgetApi = MatrixWidgetApi(
//       client: widget.client,
//       room: widget.room,
//       widgetId: widget.widgetId,
//       sendToWidget: _sendToWebIframe,
//       onHangup: widget.onHangup,
//       onContentLoaded: widget.onContentLoaded,
//     );

//     // Listen for postMessage events from the iframe
//     html.window.addEventListener('message', _onWebMessage);

//     // Register the iframe platform view
//     _registerIframePlatformView();
//   }

//   void _onWebMessage(html.Event event) {
//     if (event is html.MessageEvent) {
//       try {
//         dynamic data = event.data;
//         String rawJson;
//         if (data is String) {
//           rawJson = data;
//         } else {
//           rawJson = jsonEncode(data);
//         }
//         _onRawMessage(rawJson);
//       } catch (_) {}
//     }
//   }

//   /// Sends a JSON message to the widget running in the web iframe.
//   void _sendToWebIframe(Map<String, dynamic> message) {
//     // On web, we use window.postMessage to communicate with the iframe.
//     // The iframe should be listening for messages on its window.
//     try {
//       final json = jsonEncode(message);
//       html.window.postMessage(json, '*');
//     } catch (e) {
//       Logs().w('[WidgetWebView] Failed to postMessage to iframe', e);
//     }
//   }

//   void _registerIframePlatformView() {
//     // On web, the HtmlElementView with the registered viewType will
//     // render the iframe. Registration happens via dart:ui_web on web
//     // builds. Since we can't conditionally import dart:ui_web, the
//     // caller is responsible for ensuring the iframe view factory is
//     // registered if needed. For now we just log.
//     Logs().d('[WidgetWebView] Registered iframe view: $_iframeViewType');
//   }

//   // -------------------------------------------------------------------------
//   // Common message handling
//   // -------------------------------------------------------------------------

//   /// Called with raw JSON string from either the mobile webview or web iframe.
//   void _onRawMessage(String rawJson) {
//     try {
//       final data = jsonDecode(rawJson);
//       if (data is Map<String, dynamic>) {
//         _widgetApi?.onMessage(data);
//       }
//     } catch (_) {
//       // Not a valid JSON message, ignore
//     }
//   }

//   // -------------------------------------------------------------------------
//   // Build
//   // -------------------------------------------------------------------------

//   @override
//   Widget build(BuildContext context) {
//     if (kIsWeb) {
//       return _buildWebIframe();
//     } else if (PlatformInfos.isMobile) {
//       return _buildMobileWebView();
//     } else {
//       return _buildDesktopFallback();
//     }
//   }

//   Widget _buildMobileWebView() {
//     if (_webViewController == null) {
//       return const Center(child: CircularProgressIndicator());
//     }
//     return WebViewWidget(controller: _webViewController!);
//   }

//   Widget _buildWebIframe() {
//     if (_iframeViewType == null) {
//       return const Center(child: CircularProgressIndicator());
//     }
//     return HtmlElementView(viewType: _iframeViewType!);
//   }

//   Widget _buildDesktopFallback() {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const Icon(Icons.web, size: 64, color: Colors.white54),
//           const SizedBox(height: 16),
//           Text(
//             'Widget not supported on desktop',
//             style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                   color: Colors.white70,
//                 ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'WebView is not available on this platform.',
//             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                   color: Colors.white54,
//                 ),
//           ),
//         ],
//       ),
//     );
//   }

//   // -------------------------------------------------------------------------
//   // Lifecycle
//   // -------------------------------------------------------------------------

//   @override
//   void dispose() {
//     _widgetApi?.dispose();
//     if (kIsWeb) {
//       html.window.removeEventListener('message', _onWebMessage);
//     }
//     super.dispose();
//   }
// }
