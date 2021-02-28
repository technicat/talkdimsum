// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phrases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Phrases _$PhrasesFromJson(Map<String, dynamic> json) {
  return Phrases(
    json['name'] as String,
    (json['lines'] as List)
        ?.map(
            (e) => e == null ? null : Line.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PhrasesToJson(Phrases instance) => <String, dynamic>{
      'name': instance.name,
      'lines': instance.lines,
    };
