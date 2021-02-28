// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Line _$LineFromJson(Map<String, dynamic> json) {
  return Line(
    json['name'] as String,
    (json['words'] as List)
        ?.map(
            (e) => e == null ? null : Word.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LineToJson(Line instance) => <String, dynamic>{
      'name': instance.name,
      'words': instance.words,
    };
