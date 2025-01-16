import "dart:io";
import "package:freezed_annotation/freezed_annotation.dart";

part "vault_item.freezed.dart";

@freezed
class VaultItem with _$VaultItem {
  factory VaultItem({
    required FileSystemEntity item,
    required FileSystemEntity? thumbnail,
  }) = _VaultItem;
}
