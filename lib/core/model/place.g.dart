// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Place _$_$_PlaceFromJson(Map<String, dynamic> json) {
  return _$_Place(
    json['title'] as String,
    (json['lat'] as num).toDouble(),
    (json['lon'] as num).toDouble(),
    json['city'] as String,
    json['address'] as String,
    (json['links'] as List<dynamic>?)
            ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
  );
}

Map<String, dynamic> _$_$_PlaceToJson(_$_Place instance) => <String, dynamic>{
      'title': instance.name,
      'lat': instance.lat,
      'lon': instance.lon,
      'city': instance.city,
      'address': instance.address,
      'links': instance.links,
    };
