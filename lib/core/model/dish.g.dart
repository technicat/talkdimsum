// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dish _$DishFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['description', 'images', 'words', 'resources'],
  );
  return Dish(
    json['description'] as String,
    (json['images'] as List<dynamic>)
        .map((e) => Photo.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    (json['words'] as List<dynamic>)
        .map((e) => Word.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['resources'] as List<dynamic>)
        .map((e) => Link.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$DishToJson(Dish instance) => <String, dynamic>{
      'description': instance.description,
      'images': instance.images,
      'tags': instance.tags,
      'words': instance.words,
      'resources': instance.resources,
    };
