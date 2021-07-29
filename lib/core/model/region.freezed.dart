// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'region.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Region _$RegionFromJson(Map<String, dynamic> json) {
  return _Region.fromJson(json);
}

/// @nodoc
class _$RegionTearOff {
  const _$RegionTearOff();

  _Region call(String name, List<Place> places) {
    return _Region(
      name,
      places,
    );
  }

  Region fromJson(Map<String, Object> json) {
    return Region.fromJson(json);
  }
}

/// @nodoc
const $Region = _$RegionTearOff();

/// @nodoc
mixin _$Region {
  String get name => throw _privateConstructorUsedError;
  List<Place> get places => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RegionCopyWith<Region> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegionCopyWith<$Res> {
  factory $RegionCopyWith(Region value, $Res Function(Region) then) =
      _$RegionCopyWithImpl<$Res>;
  $Res call({String name, List<Place> places});
}

/// @nodoc
class _$RegionCopyWithImpl<$Res> implements $RegionCopyWith<$Res> {
  _$RegionCopyWithImpl(this._value, this._then);

  final Region _value;
  // ignore: unused_field
  final $Res Function(Region) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? places = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      places: places == freezed
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>,
    ));
  }
}

/// @nodoc
abstract class _$RegionCopyWith<$Res> implements $RegionCopyWith<$Res> {
  factory _$RegionCopyWith(_Region value, $Res Function(_Region) then) =
      __$RegionCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<Place> places});
}

/// @nodoc
class __$RegionCopyWithImpl<$Res> extends _$RegionCopyWithImpl<$Res>
    implements _$RegionCopyWith<$Res> {
  __$RegionCopyWithImpl(_Region _value, $Res Function(_Region) _then)
      : super(_value, (v) => _then(v as _Region));

  @override
  _Region get _value => super._value as _Region;

  @override
  $Res call({
    Object? name = freezed,
    Object? places = freezed,
  }) {
    return _then(_Region(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      places == freezed
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Region extends _Region {
  _$_Region(this.name, this.places) : super._();

  factory _$_Region.fromJson(Map<String, dynamic> json) =>
      _$_$_RegionFromJson(json);

  @override
  final String name;
  @override
  final List<Place> places;

  @override
  String toString() {
    return 'Region(name: $name, places: $places)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Region &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.places, places) ||
                const DeepCollectionEquality().equals(other.places, places)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(places);

  @JsonKey(ignore: true)
  @override
  _$RegionCopyWith<_Region> get copyWith =>
      __$RegionCopyWithImpl<_Region>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_RegionToJson(this);
  }
}

abstract class _Region extends Region {
  factory _Region(String name, List<Place> places) = _$_Region;
  _Region._() : super._();

  factory _Region.fromJson(Map<String, dynamic> json) = _$_Region.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  List<Place> get places => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RegionCopyWith<_Region> get copyWith => throw _privateConstructorUsedError;
}
