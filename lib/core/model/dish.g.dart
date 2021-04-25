// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dish _$DishFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['Description', 'images', 'words']);
  return Dish(
    json['Description'] as String,
    (json['images'] as List<dynamic>)
        .map((e) => Photo.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['Tags'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
    (json['words'] as List<dynamic>)
        .map((e) => Word.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['Resources'] as List<dynamic>?)
            ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$DishToJson(Dish instance) => <String, dynamic>{
      'Description': instance.description,
      'images': instance.images,
      'Tags': instance.tags,
      'words': instance.words,
      'Resources': instance.resources,
    };
