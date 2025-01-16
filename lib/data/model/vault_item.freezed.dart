// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vault_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VaultItem {
  FileSystemEntity get item => throw _privateConstructorUsedError;
  FileSystemEntity? get thumbnail => throw _privateConstructorUsedError;

  /// Create a copy of VaultItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VaultItemCopyWith<VaultItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VaultItemCopyWith<$Res> {
  factory $VaultItemCopyWith(VaultItem value, $Res Function(VaultItem) then) =
      _$VaultItemCopyWithImpl<$Res, VaultItem>;
  @useResult
  $Res call({FileSystemEntity item, FileSystemEntity? thumbnail});
}

/// @nodoc
class _$VaultItemCopyWithImpl<$Res, $Val extends VaultItem>
    implements $VaultItemCopyWith<$Res> {
  _$VaultItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VaultItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as FileSystemEntity,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as FileSystemEntity?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VaultItemImplCopyWith<$Res>
    implements $VaultItemCopyWith<$Res> {
  factory _$$VaultItemImplCopyWith(
          _$VaultItemImpl value, $Res Function(_$VaultItemImpl) then) =
      __$$VaultItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FileSystemEntity item, FileSystemEntity? thumbnail});
}

/// @nodoc
class __$$VaultItemImplCopyWithImpl<$Res>
    extends _$VaultItemCopyWithImpl<$Res, _$VaultItemImpl>
    implements _$$VaultItemImplCopyWith<$Res> {
  __$$VaultItemImplCopyWithImpl(
      _$VaultItemImpl _value, $Res Function(_$VaultItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of VaultItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
    Object? thumbnail = freezed,
  }) {
    return _then(_$VaultItemImpl(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as FileSystemEntity,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as FileSystemEntity?,
    ));
  }
}

/// @nodoc

class _$VaultItemImpl implements _VaultItem {
  _$VaultItemImpl({required this.item, required this.thumbnail});

  @override
  final FileSystemEntity item;
  @override
  final FileSystemEntity? thumbnail;

  @override
  String toString() {
    return 'VaultItem(item: $item, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VaultItemImpl &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, thumbnail);

  /// Create a copy of VaultItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VaultItemImplCopyWith<_$VaultItemImpl> get copyWith =>
      __$$VaultItemImplCopyWithImpl<_$VaultItemImpl>(this, _$identity);
}

abstract class _VaultItem implements VaultItem {
  factory _VaultItem(
      {required final FileSystemEntity item,
      required final FileSystemEntity? thumbnail}) = _$VaultItemImpl;

  @override
  FileSystemEntity get item;
  @override
  FileSystemEntity? get thumbnail;

  /// Create a copy of VaultItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VaultItemImplCopyWith<_$VaultItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
