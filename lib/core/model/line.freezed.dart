// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Line _$LineFromJson(Map<String, dynamic> json) {
  return _Line.fromJson(json);
}

/// @nodoc
class _$LineTearOff {
  const _$LineTearOff();

  _Line call(String name, List<Word> words) {
    return _Line(
      name,
      words,
    );
  }

  Line fromJson(Map<String, Object> json) {
    return Line.fromJson(json);
  }
}

/// @nodoc
const $Line = _$LineTearOff();

/// @nodoc
mixin _$Line {
  String get name => throw _privateConstructorUsedError;
  List<Word> get words => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LineCopyWith<Line> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineCopyWith<$Res> {
  factory $LineCopyWith(Line value, $Res Function(Line) then) =
      _$LineCopyWithImpl<$Res>;
  $Res call({String name, List<Word> words});
}

/// @nodoc
class _$LineCopyWithImpl<$Res> implements $LineCopyWith<$Res> {
  _$LineCopyWithImpl(this._value, this._then);

  final Line _value;
  // ignore: unused_field
  final $Res Function(Line) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? words = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      words: words == freezed
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ));
  }
}

/// @nodoc
abstract class _$LineCopyWith<$Res> implements $LineCopyWith<$Res> {
  factory _$LineCopyWith(_Line value, $Res Function(_Line) then) =
      __$LineCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<Word> words});
}

/// @nodoc
class __$LineCopyWithImpl<$Res> extends _$LineCopyWithImpl<$Res>
    implements _$LineCopyWith<$Res> {
  __$LineCopyWithImpl(_Line _value, $Res Function(_Line) _then)
      : super(_value, (v) => _then(v as _Line));

  @override
  _Line get _value => super._value as _Line;

  @override
  $Res call({
    Object? name = freezed,
    Object? words = freezed,
  }) {
    return _then(_Line(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      words == freezed
          ? _value.words
          : words // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Line extends _Line with DiagnosticableTreeMixin {
  _$_Line(this.name, this.words) : super._();

  factory _$_Line.fromJson(Map<String, dynamic> json) =>
      _$_$_LineFromJson(json);

  @override
  final String name;
  @override
  final List<Word> words;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Line(name: $name, words: $words)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Line'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('words', words));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Line &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.words, words) ||
                const DeepCollectionEquality().equals(other.words, words)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(words);

  @JsonKey(ignore: true)
  @override
  _$LineCopyWith<_Line> get copyWith =>
      __$LineCopyWithImpl<_Line>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LineToJson(this);
  }
}

abstract class _Line extends Line {
  factory _Line(String name, List<Word> words) = _$_Line;
  _Line._() : super._();

  factory _Line.fromJson(Map<String, dynamic> json) = _$_Line.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  List<Word> get words => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LineCopyWith<_Line> get copyWith => throw _privateConstructorUsedError;
}
