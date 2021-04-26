// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Link _$LinkFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['name', 'URL']);
  return Link(
    json['name'] as String,
    json['URL'] as String,
  );
}

Map<String, dynamic> _$LinkToJson(Link instance) => <String, dynamic>{
      'name': instance.name,
      'URL': instance.url,
    };
