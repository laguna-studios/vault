import "dart:io";

import "package:dartx/dartx_io.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:vault/ui/viewmodel/vault_viewmodel.dart";

class FileViewerScreen extends StatefulWidget {
  const FileViewerScreen({super.key, required this.index});

  final int index;

  @override
  State<FileViewerScreen> createState() => _FileViewerScreenState();
}

class _FileViewerScreenState extends State<FileViewerScreen> {
  late final PageController _pageController = PageController(initialPage: widget.index);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final VaultViewModel viewModel = context.read<VaultViewModel>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        itemCount: viewModel.items.length,
        itemBuilder: (context, index) => _FileViewer(viewModel.items.elementAt(index)),
      ),
    );
  }
}

class _FileViewer extends StatelessWidget {
  const _FileViewer(this.file);

  final FileSystemEntity file;

  @override
  Widget build(BuildContext context) {
    if ([".png", ".jpg", ".jpeg", ".gif"].contains(file.extension)) {
      return Image.file(file as File);
    }

    return Placeholder();
  }
}
