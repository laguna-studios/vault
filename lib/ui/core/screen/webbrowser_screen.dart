import "package:flutter/material.dart";
import "package:vault/context_extension.dart";
import "package:webview_flutter/webview_flutter.dart";

class WebbrowserScreen extends StatefulWidget {
  static Future<T?> open<T>(BuildContext context, {required String title, required String url}) => context.go<T>(WebbrowserScreen(title: title, url: url));

  final String title;
  final String url;

  const WebbrowserScreen({super.key, required this.title, required this.url});

  @override
  State<WebbrowserScreen> createState() => _WebbrowserScreenState();
}

class _WebbrowserScreenState extends State<WebbrowserScreen> {

  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();
    _controller.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
