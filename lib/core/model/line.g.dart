// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Line _$_$_LineFromJson(Map<String, dynamic> json) {
  return _$_Line(
    json['name'] as String,
    (json['words'] as List<dynamic>)
        .map((e) => Word.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_LineToJson(_$_Line instance) => <String, dynamic>{
      'name': instance.name,
      'words': instance.words,
    };
