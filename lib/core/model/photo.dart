import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.g.dart';
part 'photo.freezed.dart';

//@JsonSerializable()
@freezed
class Photo with _$Photo {
  Photo._();
  /*{
  @JsonKey(name: 'image', required: true)
  final String name;
  final String? place; 

  Photo(this.name, this.place); */

  factory Photo(@required @JsonKey(name: 'image') String name,
      [@Default("") String place]) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

//  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
