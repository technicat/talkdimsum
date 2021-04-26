import 'package:url_launcher/url_launcher.dart';

import 'package:json_annotation/json_annotation.dart';

part 'link.g.dart';

@JsonSerializable()
class Link {
  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(name: 'URL', defaultValue: '')
  final String url;

  Link(this.name, this.url);

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);

  void goto() {
    launch(url);
  }
}
