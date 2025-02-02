import "package:flutter/material.dart";
import "package:flutter_inappwebview/flutter_inappwebview.dart";
import "package:vault/context_extension.dart";

class WebbrowserScreen extends StatelessWidget {
  static Future<T?> open<T>(BuildContext context, {required String title, required String url}) => context.go<T>(WebbrowserScreen(title: title, url: url));

  final String title;
  final String url;

  const WebbrowserScreen({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: InAppWebView(
        initialOptions: InAppWebViewGroupOptions(
          android: AndroidInAppWebViewOptions(useOnRenderProcessGone: true),
        ),
        initialUrlRequest:
            URLRequest(url: Uri.parse("https://lagunastudios.de/github/vault/refs/heads/main/html/privacy.html")),
      ),
    );
  }
}
