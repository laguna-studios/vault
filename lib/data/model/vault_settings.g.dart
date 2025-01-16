// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vault_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VaultSettingsImpl _$$VaultSettingsImplFromJson(Map<String, dynamic> json) =>
    _$VaultSettingsImpl(
      listView: json['listView'] as bool,
      columnCount: (json['columnCount'] as num).toInt(),
      verticalScroll: json['verticalScroll'] as bool,
    );

Map<String, dynamic> _$$VaultSettingsImplToJson(_$VaultSettingsImpl instance) =>
    <String, dynamic>{
      'listView': instance.listView,
      'columnCount': instance.columnCount,
      'verticalScroll': instance.verticalScroll,
    };
