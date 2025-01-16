import "dart:io";

import "package:dartx/dartx_io.dart";

extension FileSystemEntityExtension on FileSystemEntity {
  bool get isImage => [".jpg", ".jpeg", ".png", ".webp"].contains(extension);
  bool get isVideo => [".mp4", ".avi", ".webm"].contains(extension);
}
