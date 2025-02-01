import "package:flutter/material.dart";
import "package:flutter_inappwebview/flutter_inappwebview.dart";
import "package:vault/context_extension.dart";

class WebbrowserScreen extends StatelessWidget {

  static Future<T?> open<T>(BuildContext context, String url) => context.go<T>(WebbrowserScreen(url: url));

  final String url;

  const WebbrowserScreen({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri("https://lagunastudios.de/github/vault/refs/heads/main/html/privacy.html")),
      ),
    );
  }
}