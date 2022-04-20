import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'link.g.dart';
part 'link.freezed.dart';

@freezed
class Link with _$Link {
  Link._();

  factory Link(
          @required String name, @required @JsonKey(name: 'URL') String url) =
      _Link;
  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  goto() => launch(url);
}
