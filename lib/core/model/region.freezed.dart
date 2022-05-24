// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'region.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Region _$RegionFromJson(Map<String, dynamic> json) {
  return _Region.fromJson(json);
}

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
abstract class _$$_RegionCopyWith<$Res> implements $RegionCopyWith<$Res> {
  factory _$$_RegionCopyWith(_$_Region value, $Res Function(_$_Region) then) =
      __$$_RegionCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<Place> places});
}

/// @nodoc
class __$$_RegionCopyWithImpl<$Res> extends _$RegionCopyWithImpl<$Res>
    implements _$$_RegionCopyWith<$Res> {
  __$$_RegionCopyWithImpl(_$_Region _value, $Res Function(_$_Region) _then)
      : super(_value, (v) => _then(v as _$_Region));

  @override
  _$_Region get _value => super._value as _$_Region;

  @override
  $Res call({
    Object? name = freezed,
    Object? places = freezed,
  }) {
    return _then(_$_Region(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      places == freezed
          ? _value._places
          : places // ignore: cast_nullable_to_non_nullable
              as List<Place>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Region extends _Region {
  _$_Region(this.name, final List<Place> places)
      : _places = places,
        super._();

  factory _$_Region.fromJson(Map<String, dynamic> json) =>
      _$$_RegionFromJson(json);

  @override
  final String name;
  final List<Place> _places;
  @override
  List<Place> get places {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_places);
  }

  @override
  String toString() {
    return 'Region(name: $name, places: $places)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Region &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other._places, _places));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_places));

  @JsonKey(ignore: true)
  @override
  _$$_RegionCopyWith<_$_Region> get copyWith =>
      __$$_RegionCopyWithImpl<_$_Region>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RegionToJson(this);
  }
}

abstract class _Region extends Region {
  factory _Region(final String name, final List<Place> places) = _$_Region;
  _Region._() : super._();

  factory _Region.fromJson(Map<String, dynamic> json) = _$_Region.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  List<Place> get places => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_RegionCopyWith<_$_Region> get copyWith =>
      throw _privateConstructorUsedError;
}
