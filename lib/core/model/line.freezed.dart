// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Line _$LineFromJson(Map<String, dynamic> json) {
  return _Line.fromJson(json);
}

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
abstract class _$$_LineCopyWith<$Res> implements $LineCopyWith<$Res> {
  factory _$$_LineCopyWith(_$_Line value, $Res Function(_$_Line) then) =
      __$$_LineCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<Word> words});
}

/// @nodoc
class __$$_LineCopyWithImpl<$Res> extends _$LineCopyWithImpl<$Res>
    implements _$$_LineCopyWith<$Res> {
  __$$_LineCopyWithImpl(_$_Line _value, $Res Function(_$_Line) _then)
      : super(_value, (v) => _then(v as _$_Line));

  @override
  _$_Line get _value => super._value as _$_Line;

  @override
  $Res call({
    Object? name = freezed,
    Object? words = freezed,
  }) {
    return _then(_$_Line(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      words == freezed
          ? _value._words
          : words // ignore: cast_nullable_to_non_nullable
              as List<Word>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Line extends _Line with DiagnosticableTreeMixin {
  _$_Line(this.name, final List<Word> words)
      : _words = words,
        super._();

  factory _$_Line.fromJson(Map<String, dynamic> json) => _$$_LineFromJson(json);

  @override
  final String name;
  final List<Word> _words;
  @override
  List<Word> get words {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_words);
  }

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
        (other.runtimeType == runtimeType &&
            other is _$_Line &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other._words, _words));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_words));

  @JsonKey(ignore: true)
  @override
  _$$_LineCopyWith<_$_Line> get copyWith =>
      __$$_LineCopyWithImpl<_$_Line>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LineToJson(this);
  }
}

abstract class _Line extends Line {
  factory _Line(final String name, final List<Word> words) = _$_Line;
  _Line._() : super._();

  factory _Line.fromJson(Map<String, dynamic> json) = _$_Line.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  List<Word> get words => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_LineCopyWith<_$_Line> get copyWith => throw _privateConstructorUsedError;
}
