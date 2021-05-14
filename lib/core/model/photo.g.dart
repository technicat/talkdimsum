// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Photo _$_$_PhotoFromJson(Map<String, dynamic> json) {
  return _$_Photo(
    json['image'] as String,
    json['place'] as String? ?? '',
  );
}

Map<String, dynamic> _$_$_PhotoToJson(_$_Photo instance) => <String, dynamic>{
      'image': instance.name,
      'place': instance.place,
    };
