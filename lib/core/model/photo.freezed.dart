// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'photo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return _Photo.fromJson(json);
}

/// @nodoc
class _$PhotoTearOff {
  const _$PhotoTearOff();

  _Photo call(@JsonKey(name: 'image') String name, [String place = ""]) {
    return _Photo(
      name,
      place,
    );
  }

  Photo fromJson(Map<String, Object> json) {
    return Photo.fromJson(json);
  }
}

/// @nodoc
const $Photo = _$PhotoTearOff();

/// @nodoc
mixin _$Photo {
  @JsonKey(name: 'image')
  String get name => throw _privateConstructorUsedError;
  String get place => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoCopyWith<Photo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoCopyWith<$Res> {
  factory $PhotoCopyWith(Photo value, $Res Function(Photo) then) =
      _$PhotoCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'image') String name, String place});
}

/// @nodoc
class _$PhotoCopyWithImpl<$Res> implements $PhotoCopyWith<$Res> {
  _$PhotoCopyWithImpl(this._value, this._then);

  final Photo _value;
  // ignore: unused_field
  final $Res Function(Photo) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? place = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      place: place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PhotoCopyWith<$Res> implements $PhotoCopyWith<$Res> {
  factory _$PhotoCopyWith(_Photo value, $Res Function(_Photo) then) =
      __$PhotoCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'image') String name, String place});
}

/// @nodoc
class __$PhotoCopyWithImpl<$Res> extends _$PhotoCopyWithImpl<$Res>
    implements _$PhotoCopyWith<$Res> {
  __$PhotoCopyWithImpl(_Photo _value, $Res Function(_Photo) _then)
      : super(_value, (v) => _then(v as _Photo));

  @override
  _Photo get _value => super._value as _Photo;

  @override
  $Res call({
    Object? name = freezed,
    Object? place = freezed,
  }) {
    return _then(_Photo(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      place == freezed
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Photo extends _Photo with DiagnosticableTreeMixin {
  _$_Photo(@JsonKey(name: 'image') this.name, [this.place = ""]) : super._();

  factory _$_Photo.fromJson(Map<String, dynamic> json) =>
      _$_$_PhotoFromJson(json);

  @override
  @JsonKey(name: 'image')
  final String name;
  @JsonKey(defaultValue: "")
  @override
  final String place;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Photo(name: $name, place: $place)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Photo'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('place', place));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Photo &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.place, place) ||
                const DeepCollectionEquality().equals(other.place, place)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(place);

  @JsonKey(ignore: true)
  @override
  _$PhotoCopyWith<_Photo> get copyWith =>
      __$PhotoCopyWithImpl<_Photo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PhotoToJson(this);
  }
}

abstract class _Photo extends Photo {
  factory _Photo(@JsonKey(name: 'image') String name, [String place]) =
      _$_Photo;
  _Photo._() : super._();

  factory _Photo.fromJson(Map<String, dynamic> json) = _$_Photo.fromJson;

  @override
  @JsonKey(name: 'image')
  String get name => throw _privateConstructorUsedError;
  @override
  String get place => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PhotoCopyWith<_Photo> get copyWith => throw _privateConstructorUsedError;
}
