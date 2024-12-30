import "dart:io";
import "dart:typed_data";

import "package:path/path.dart";
import "package:vault/data/service/vault_datasource.dart";

class VaultRepository {
  final VaultDatasource _vaultDatasource;
  final String _vault;

  VaultRepository({required VaultDatasource vaultDatasource, required String vault})
      : _vaultDatasource = vaultDatasource,
        _vault = vault;

  Future<void> createVault() async {
    final bool exists = await _vaultDatasource.directoryExists(_vault);
    if (exists) return;
    return _vaultDatasource.createDirectory(_vault);
  }

  Future<Iterable<FileSystemEntity>> listFiles() async {
    return _vaultDatasource.listDirectory(_vault);
  }

  Future<void> addFile(String path, Uint8List data) async {
    _vaultDatasource.createFile(join(_vault, path), data);
  }

  Future<void> deleteFile(String path) async {
    _vaultDatasource.deleteFile(join(_vault, path));
  }
}
