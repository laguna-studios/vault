import "dart:io";
import "dart:typed_data";

import "package:dartx/dartx.dart";
import "package:dartx/dartx_io.dart";
import "package:file_picker/file_picker.dart";
import "package:flutter/material.dart";
import "package:path/path.dart";
import "package:vault/data/repository/vault_repository.dart";

class VaultViewModel extends ChangeNotifier {
  final VaultRepository _vaultRepository;

  final Set<FileSystemEntity> _selectedFiles = {};

  bool _loading = false;
  bool _isListViewMode = true;
  String? _error;
  Iterable<FileSystemEntity> _items = [];
  List<Directory> _location = [];

  VaultViewModel({required VaultRepository vaultRepository}) : _vaultRepository = vaultRepository;

  bool get loading => _loading;
  bool get hasError => _error != null;
  String get error => _error!;

  bool get isSelectionActive => _selectedFiles.isNotEmpty;
  Set<FileSystemEntity> get selectedFiles => _selectedFiles;

  bool get isListViewMode => _isListViewMode;
  Iterable<FileSystemEntity> get items => _items;
  Iterable<File> get files => _items.whereType<File>();
  String get location => joinAll(_location.map((e) => e.name));

  void toggleItem(int index) {
    if (!_selectedFiles.add(_items.elementAt(index))) _selectedFiles.remove(_items.elementAt(index));
    notifyListeners();
  }

  void selectAll() {
    _selectedFiles.addAll(_items);
    notifyListeners();
  }

  void cancelSelection() {
    _selectedFiles.clear();
    notifyListeners();
  }

  void loadVaultContent() async {
    try {
      _loading = true;
      notifyListeners();

      _items = await _vaultRepository.listFiles(location);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void toggleViewMode() {
    _isListViewMode = !_isListViewMode;
    notifyListeners();
  }

  void deleteSelection() {
    for (final FileSystemEntity file in _selectedFiles) {
      _vaultRepository.deleteFile(join(location, file.name));
    }
    _selectedFiles.clear();
    notifyListeners();

    loadVaultContent();
  }

  void enterDirectory(Directory directory) {
    _location.add(directory);
    loadVaultContent();
  }

  void goUp() {
    if (_location.isEmpty) return;
    _location.removeLast();
    loadVaultContent();
  }

  Future<void> addFiles() async {
    try {
      final FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true, withReadStream: true);
      if (result == null) return;

      for (final PlatformFile file in result.files) {
        List<List<int>>? data = await file.readStream?.toList();
        if (data == null) continue;
        await _vaultRepository.addFile(join(location, file.name), Uint8List.fromList(data.flatten()));
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      loadVaultContent();
    }
  }

  Future<void> createDirectory(String name) async {
    _vaultRepository.createDirectory(join(location, name));
    loadVaultContent();
  }
}
