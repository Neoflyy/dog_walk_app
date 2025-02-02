// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pets_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PetsState {
  Status get status => throw _privateConstructorUsedError;
  List<PetModel> get pets => throw _privateConstructorUsedError;

  /// Create a copy of PetsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PetsStateCopyWith<PetsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PetsStateCopyWith<$Res> {
  factory $PetsStateCopyWith(PetsState value, $Res Function(PetsState) then) =
      _$PetsStateCopyWithImpl<$Res, PetsState>;
  @useResult
  $Res call({Status status, List<PetModel> pets});
}

/// @nodoc
class _$PetsStateCopyWithImpl<$Res, $Val extends PetsState>
    implements $PetsStateCopyWith<$Res> {
  _$PetsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PetsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? pets = null,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      pets: null == pets
          ? _value.pets
          : pets // ignore: cast_nullable_to_non_nullable
              as List<PetModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PetsStateImplCopyWith<$Res>
    implements $PetsStateCopyWith<$Res> {
  factory _$$PetsStateImplCopyWith(
          _$PetsStateImpl value, $Res Function(_$PetsStateImpl) then) =
      __$$PetsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, List<PetModel> pets});
}

/// @nodoc
class __$$PetsStateImplCopyWithImpl<$Res>
    extends _$PetsStateCopyWithImpl<$Res, _$PetsStateImpl>
    implements _$$PetsStateImplCopyWith<$Res> {
  __$$PetsStateImplCopyWithImpl(
      _$PetsStateImpl _value, $Res Function(_$PetsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PetsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? pets = null,
  }) {
    return _then(_$PetsStateImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      pets: null == pets
          ? _value._pets
          : pets // ignore: cast_nullable_to_non_nullable
              as List<PetModel>,
    ));
  }
}

/// @nodoc

class _$PetsStateImpl extends _PetsState {
  const _$PetsStateImpl(
      {this.status = Status.initial, final List<PetModel> pets = const []})
      : _pets = pets,
        super._();

  @override
  @JsonKey()
  final Status status;
  final List<PetModel> _pets;
  @override
  @JsonKey()
  List<PetModel> get pets {
    if (_pets is EqualUnmodifiableListView) return _pets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pets);
  }

  @override
  String toString() {
    return 'PetsState(status: $status, pets: $pets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PetsStateImpl &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other._pets, _pets));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(_pets));

  /// Create a copy of PetsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PetsStateImplCopyWith<_$PetsStateImpl> get copyWith =>
      __$$PetsStateImplCopyWithImpl<_$PetsStateImpl>(this, _$identity);
}

abstract class _PetsState extends PetsState {
  const factory _PetsState({final Status status, final List<PetModel> pets}) =
      _$PetsStateImpl;
  const _PetsState._() : super._();

  @override
  Status get status;
  @override
  List<PetModel> get pets;

  /// Create a copy of PetsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PetsStateImplCopyWith<_$PetsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
