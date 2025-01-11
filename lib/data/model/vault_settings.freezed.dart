// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vault_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VaultSettings _$VaultSettingsFromJson(Map<String, dynamic> json) {
  return _VaultSettings.fromJson(json);
}

/// @nodoc
mixin _$VaultSettings {
  bool get listView => throw _privateConstructorUsedError;
  int get rowCount => throw _privateConstructorUsedError;

  /// Serializes this VaultSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VaultSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VaultSettingsCopyWith<VaultSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaultSettingsCopyWith<$Res> {
  factory $VaultSettingsCopyWith(
          VaultSettings value, $Res Function(VaultSettings) then) =
      _$VaultSettingsCopyWithImpl<$Res, VaultSettings>;
  @useResult
  $Res call({bool listView, int rowCount});
}

/// @nodoc
class _$VaultSettingsCopyWithImpl<$Res, $Val extends VaultSettings>
    implements $VaultSettingsCopyWith<$Res> {
  _$VaultSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VaultSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listView = null,
    Object? rowCount = null,
  }) {
    return _then(_value.copyWith(
      listView: null == listView
          ? _value.listView
          : listView // ignore: cast_nullable_to_non_nullable
              as bool,
      rowCount: null == rowCount
          ? _value.rowCount
          : rowCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VaultSettingsImplCopyWith<$Res>
    implements $VaultSettingsCopyWith<$Res> {
  factory _$$VaultSettingsImplCopyWith(
          _$VaultSettingsImpl value, $Res Function(_$VaultSettingsImpl) then) =
      __$$VaultSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool listView, int rowCount});
}

/// @nodoc
class __$$VaultSettingsImplCopyWithImpl<$Res>
    extends _$VaultSettingsCopyWithImpl<$Res, _$VaultSettingsImpl>
    implements _$$VaultSettingsImplCopyWith<$Res> {
  __$$VaultSettingsImplCopyWithImpl(
      _$VaultSettingsImpl _value, $Res Function(_$VaultSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of VaultSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listView = null,
    Object? rowCount = null,
  }) {
    return _then(_$VaultSettingsImpl(
      listView: null == listView
          ? _value.listView
          : listView // ignore: cast_nullable_to_non_nullable
              as bool,
      rowCount: null == rowCount
          ? _value.rowCount
          : rowCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VaultSettingsImpl implements _VaultSettings {
  _$VaultSettingsImpl({required this.listView, required this.rowCount});

  factory _$VaultSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VaultSettingsImplFromJson(json);

  @override
  final bool listView;
  @override
  final int rowCount;

  @override
  String toString() {
    return 'VaultSettings(listView: $listView, rowCount: $rowCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaultSettingsImpl &&
            (identical(other.listView, listView) ||
                other.listView == listView) &&
            (identical(other.rowCount, rowCount) ||
                other.rowCount == rowCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, listView, rowCount);

  /// Create a copy of VaultSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VaultSettingsImplCopyWith<_$VaultSettingsImpl> get copyWith =>
      __$$VaultSettingsImplCopyWithImpl<_$VaultSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VaultSettingsImplToJson(
      this,
    );
  }
}

abstract class _VaultSettings implements VaultSettings {
  factory _VaultSettings(
      {required final bool listView,
      required final int rowCount}) = _$VaultSettingsImpl;

  factory _VaultSettings.fromJson(Map<String, dynamic> json) =
      _$VaultSettingsImpl.fromJson;

  @override
  bool get listView;
  @override
  int get rowCount;

  /// Create a copy of VaultSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VaultSettingsImplCopyWith<_$VaultSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}