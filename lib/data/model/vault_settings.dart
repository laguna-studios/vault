import "package:freezed_annotation/freezed_annotation.dart";

part "vault_settings.freezed.dart";
part "vault_settings.g.dart";

@freezed
class VaultSettings with _$VaultSettings {
  factory VaultSettings({
    required bool listView,
    required int columnCount,
    required bool verticalScroll,
  }) = _VaultSettings;

  factory VaultSettings.fromJson(Map<String, dynamic> json) => _$VaultSettingsFromJson(json);
}
