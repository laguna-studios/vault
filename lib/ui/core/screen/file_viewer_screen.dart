import "package:flutter/material.dart";

class FileViewerScreen extends StatelessWidget {
  const FileViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(itemBuilder: (context, index) => _FileViewer()),
    );
  }
}

class _FileViewer extends StatelessWidget {
  const _FileViewer();

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}
