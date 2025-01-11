import "dart:convert";
import "dart:io";
import "dart:typed_data";

import "package:crypto/crypto.dart";
import "package:path/path.dart";
import "package:vault/data/model/vault_settings.dart";
import "package:vault/data/service/vault_datasource.dart";

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

  Future<Iterable<FileSystemEntity>> listFiles(String path) async {
    return _vaultDatasource.listDirectory(join(_vault, path));
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
      return VaultSettings(listView: true, columnCount: 3);
    }
  }

  Future<void> saveVaultSettings(VaultSettings settings) async {
    return _vaultDatasource.writeFileAsString(_settingsPath, jsonEncode(settings.toJson()));
  }
}
