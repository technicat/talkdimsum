// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return Place(
    json['title'] as String,
    (json['lat'] as num)?.toDouble(),
    (json['lon'] as num)?.toDouble(),
    json['city'] as String,
    (json['links'] as List)
        ?.map(
            (e) => e == null ? null : Link.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['address'] as String,
  );
}

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'title': instance.name,
      'lat': instance.lat,
      'lon': instance.lon,
      'city': instance.city,
      'address': instance.address,
      'links': instance.links,
    };
