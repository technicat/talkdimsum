// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Region _$RegionFromJson(Map<String, dynamic> json) {
  return Region(
    json['name'] as String,
    (json['places'] as List)
        ?.map(
            (e) => e == null ? null : Place.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'name': instance.name,
      'places': instance.places,
    };
