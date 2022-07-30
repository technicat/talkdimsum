// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phrases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Phrases _$$_PhrasesFromJson(Map<String, dynamic> json) => _$_Phrases(
      json['name'] as String,
      (json['lines'] as List<dynamic>)
          .map((e) => Line.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PhrasesToJson(_$_Phrases instance) =>
    <String, dynamic>{
      'name': instance.name,
      'lines': instance.lines,
    };
