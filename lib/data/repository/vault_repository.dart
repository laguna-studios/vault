import "dart:convert";
import "dart:io";
import "package:http/http.dart" as http;

import "package:crypto/crypto.dart";
import "package:flutter/foundation.dart";
import "package:image/image.dart";
import "package:mime/mime.dart";
import "package:path/path.dart";
import "package:uuid/v4.dart";
import "package:vault/data/model/vault_item.dart";
import "package:vault/data/model/vault_settings.dart";
import "package:vault/data/service/vault_datasource.dart";
import "package:vault/file_system_entity_extension.dart";
import "package:video_thumbnail/video_thumbnail.dart" as vt;

class VaultRepository {
  final VaultDatasource _vaultDatasource;
  final String _vault;

  String get _settingsPath => join(_vault, "settings.json");

  VaultRepository({required VaultDatasource vaultDatasource, required String vault})
      : _vaultDatasource = vaultDatasource,
        _vault = sha256.convert(vault.codeUnits).toString();

  Future<void> createVault() async {
    final bool exists = await _vaultDatasource.directoryExists(_vault);
    if (exists) return;
    return _vaultDatasource.createDirectory(_vault);
  }

  Future<Iterable<VaultItem>> listFiles(String path) async {
    final Iterable<FileSystemEntity> items = await _vaultDatasource.listDirectory(join(_vault, path));
    final List<VaultItem> result = [];
    for (final item in items) {
      try {
        
      result.add(VaultItem(item: item, thumbnail: await _getThumbnail(item)));
      } catch (e) {
        print(e);
      }
    }

    return result;
  }

  Future<void> writeFile(String path, Uint8List data) async {
    _vaultDatasource.writeFileAsBytes(join(_vault, path), data);
  }

  Future<void> deleteFile(String path) async {
    _vaultDatasource.deleteFile(join(_vault, path));
  }

  Future<void> createDirectory(String path) async {
    _vaultDatasource.createDirectory(join(_vault, path));
  }

  Future<VaultSettings> loadVaultSettings() async {
    try {
      String content = await _vaultDatasource.readFile(_settingsPath);
      return VaultSettings.fromJson(jsonDecode(content));
    } catch (_) {
      return VaultSettings(listView: true, columnCount: 3, verticalScroll: true);
    }
  }

  Future<void> saveVaultSettings(VaultSettings settings) async {
    return _vaultDatasource.writeFileAsString(_settingsPath, jsonEncode(settings.toJson()));
  }

  Future<File?> _getThumbnail(FileSystemEntity item) async {
    if (item is! File) return null;

    final String thumbnailsDir = join(_vault, ".thumbs");

    final File thumbnail = File("${item.path.replaceFirst(_vault, thumbnailsDir)}.thumb.jpg");
    if (kReleaseMode && thumbnail.existsSync()) return thumbnail;

    thumbnail.parent.createSync(recursive: true);
    if (item.isImage) {
      Image? image = await decodeImageFile(item.path);
      if (image == null) return null;

      image = copyResize(image, width: 512);
      thumbnail.writeAsBytesSync(encodeJpg(image));
      return thumbnail;
    } else if (item.isVideo) {
      final Uint8List? thumbnailData = await vt.VideoThumbnail.thumbnailData(
        video: item.path,
        maxHeight: 512,
        maxWidth: 512,
        imageFormat: vt.ImageFormat.JPEG,
      );
      if (thumbnailData == null) return null;
      thumbnail.writeAsBytesSync(thumbnailData);
      return thumbnail;
    }

    return null;
  }

  Future<bool> downloadFile(String path, String url, {String? filename}) async {
    http.Response resp = await http.get(Uri.parse(url));
    if (resp.statusCode != 200) throw FormatException("Invalid Status Code: ${resp.statusCode}");

    if (filename == null) {
      final String ext = extensionFromMime(resp.headers["content-type"] ?? "") ?? "mp4";
      filename = "${UuidV4().generate()}.$ext";
    }

    await _vaultDatasource.writeFileAsBytes(join(_vault, path, filename), resp.bodyBytes);
    return true;
  }

  Future<void> deleteVault() => _vaultDatasource.deleteFile(_vault);
}
