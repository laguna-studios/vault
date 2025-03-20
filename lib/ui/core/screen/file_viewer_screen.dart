import "dart:io";

import "package:chewie/chewie.dart";
import "package:dartx/dartx_io.dart";
import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:open_file/open_file.dart";
import "package:provider/provider.dart";
import "package:vault/data/model/vault_item.dart";
import "package:vault/file_system_entity_extension.dart";
import "package:vault/ui/viewmodel/vault_viewmodel.dart";
import "package:video_player/video_player.dart";

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
        scrollDirection: viewModel.isVerticalScroll ? Axis.vertical : Axis.horizontal,
        controller: _pageController,
        itemCount: viewModel.files.length,
        itemBuilder: (context, index) => _FileViewer(viewModel.files.elementAt(index)),
      ),
    );
  }
}

class _FileViewer extends StatefulWidget {
  const _FileViewer(this.file);

  final VaultItem file;

  @override
  State<_FileViewer> createState() => _FileViewerState();
}

class _FileViewerState extends State<_FileViewer> {
  ChewieController? _chewieController;
  VideoPlayerController? _videoPlayerController;
  double? aspectRatio;

  @override
  void initState() {
    super.initState();
    if (!widget.file.item.isVideo) return;

    _videoPlayerController = VideoPlayerController.file(widget.file.item as File);
    _videoPlayerController!.addListener(_listenForAspectRatio);

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      autoPlay: true,
      looping: true,
      showControlsOnInitialize: false,
    );
  }

  @override
  void dispose() {
    _videoPlayerController?.removeListener(_listenForAspectRatio);
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  void _listenForAspectRatio() {
    if (!_videoPlayerController!.value.isInitialized) return;
    aspectRatio = _videoPlayerController!.value.aspectRatio;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.file.item.isImage) {
      return Image.file(widget.file.item as File);
    } else if (widget.file.item.isVideo) {
      if (aspectRatio == null) return Center(child: CircularProgressIndicator());
      return AspectRatio(
        aspectRatio: aspectRatio!,
        child: Chewie(controller: _chewieController!),
      );
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.broken_image,
            size: 128,
          ),
          Gap(8),
          Text(widget.file.item.name),
          Gap(16),
          OutlinedButton.icon(
            onPressed: () async {
              final OpenResult result = await OpenFile.open(widget.file.item.path);

              if (result.type != ResultType.done) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("This file can't be open")));
              }
            },
            label: Text("Open File"),
            icon: Icon(Icons.file_open),
          ),
        ],
      ),
    );
  }
}
