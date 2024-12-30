import "dart:io";
import "dart:typed_data";

import "package:path/path.dart";

class VaultDatasource {
  final Directory _rootDirectory;

  VaultDatasource({required Directory rootDirectory}) : _rootDirectory = rootDirectory;

  Future<bool> directoryExists(String path) => Directory(join(_rootDirectory.path, path)).exists();
  Future<bool> fileExists(String path) => File(join(_rootDirectory.path, path)).exists();

  Future<void> createDirectory(String path) => Directory(join(_rootDirectory.path, path)).create();
  Future<void> createFile(String path, Uint8List data) => File(join(_rootDirectory.path, path)).writeAsBytes(data);

  Future<Iterable<FileSystemEntity>> listDirectory(String path) =>
      Directory(join(_rootDirectory.path, path)).list().toList();
  Future<Uint8List> readFile(String path) => File(join(_rootDirectory.path, path)).readAsBytes();
  Future<void> deleteFile(String path) => File(join(_rootDirectory.path, path)).delete(recursive: true);
}
