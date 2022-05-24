// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'phrases.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Phrases _$PhrasesFromJson(Map<String, dynamic> json) {
  return _Phrases.fromJson(json);
}

/// @nodoc
mixin _$Phrases {
  String get name => throw _privateConstructorUsedError;
  List<Line> get lines => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhrasesCopyWith<Phrases> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhrasesCopyWith<$Res> {
  factory $PhrasesCopyWith(Phrases value, $Res Function(Phrases) then) =
      _$PhrasesCopyWithImpl<$Res>;
  $Res call({String name, List<Line> lines});
}

/// @nodoc
class _$PhrasesCopyWithImpl<$Res> implements $PhrasesCopyWith<$Res> {
  _$PhrasesCopyWithImpl(this._value, this._then);

  final Phrases _value;
  // ignore: unused_field
  final $Res Function(Phrases) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? lines = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lines: lines == freezed
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<Line>,
    ));
  }
}

/// @nodoc
abstract class _$$_PhrasesCopyWith<$Res> implements $PhrasesCopyWith<$Res> {
  factory _$$_PhrasesCopyWith(
          _$_Phrases value, $Res Function(_$_Phrases) then) =
      __$$_PhrasesCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<Line> lines});
}

/// @nodoc
class __$$_PhrasesCopyWithImpl<$Res> extends _$PhrasesCopyWithImpl<$Res>
    implements _$$_PhrasesCopyWith<$Res> {
  __$$_PhrasesCopyWithImpl(_$_Phrases _value, $Res Function(_$_Phrases) _then)
      : super(_value, (v) => _then(v as _$_Phrases));

  @override
  _$_Phrases get _value => super._value as _$_Phrases;

  @override
  $Res call({
    Object? name = freezed,
    Object? lines = freezed,
  }) {
    return _then(_$_Phrases(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lines == freezed
          ? _value._lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<Line>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Phrases extends _Phrases with DiagnosticableTreeMixin {
  _$_Phrases(this.name, final List<Line> lines)
      : _lines = lines,
        super._();

  factory _$_Phrases.fromJson(Map<String, dynamic> json) =>
      _$$_PhrasesFromJson(json);

  @override
  final String name;
  final List<Line> _lines;
  @override
  List<Line> get lines {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Phrases(name: $name, lines: $lines)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Phrases'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('lines', lines));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Phrases &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other._lines, _lines));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(_lines));

  @JsonKey(ignore: true)
  @override
  _$$_PhrasesCopyWith<_$_Phrases> get copyWith =>
      __$$_PhrasesCopyWithImpl<_$_Phrases>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhrasesToJson(this);
  }
}

abstract class _Phrases extends Phrases {
  factory _Phrases(final String name, final List<Line> lines) = _$_Phrases;
  _Phrases._() : super._();

  factory _Phrases.fromJson(Map<String, dynamic> json) = _$_Phrases.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  List<Line> get lines => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_PhrasesCopyWith<_$_Phrases> get copyWith =>
      throw _privateConstructorUsedError;
}
