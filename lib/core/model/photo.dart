import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo.g.dart';
part 'photo.freezed.dart';

@freezed
class Photo with _$Photo {
  Photo._();

  factory Photo(@required @JsonKey(name: 'image') String name,
      [@Default("") String place]) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}
