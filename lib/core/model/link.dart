import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'link.g.dart';
part 'link.freezed.dart';

//@JsonSerializable()
@freezed
class Link with _$Link {
  Link._();
  /* @JsonKey(required: true)
  final String name;
  @JsonKey(name: 'URL', required: true)
  final String url; */

  factory Link(
          @required String name, @required @JsonKey(name: 'URL') String url) =
      _Link;

//  Link(this.name, this.url);

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

//  Map<String, dynamic> toJson() => _$LinkToJson(this);

  void goto() {
    launch(url);
  }
}
