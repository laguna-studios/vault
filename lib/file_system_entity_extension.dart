import "dart:io";

import "package:dartx/dartx_io.dart";

extension FileSystemEntityExtension on FileSystemEntity {
  bool get isImage => [".jpg", ".jpeg", ".png", ".gif", ".bmp", ".webp"].contains(extension);
  bool get isVideo => [
        ".mp4",
        ".webm",
        ".3gp",
        ".mov",
        ".m4v",
        ".ogg",
      ].contains(extension);
}
