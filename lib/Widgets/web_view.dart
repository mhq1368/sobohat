// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class HtmlWebViewScreen extends StatefulWidget {
//   final String url;

//   HtmlWebViewScreen({required this.url});

//   @override
//   _HtmlWebViewScreenState createState() => _HtmlWebViewScreenState();
// }

// class _HtmlWebViewScreenState extends State<HtmlWebViewScreen> {
//   late final WebViewController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = WebViewController()
//       ..loadRequest(Uri.parse(widget.url))
//       ..setJavaScriptMode(JavaScriptMode.unrestricted);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: WebViewWidget(controller: _controller),
//     );
//   }
// }
