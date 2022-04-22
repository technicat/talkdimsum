import 'package:flutter/foundation.dart';
import 'package:share/share.dart';
import 'package:sprintf/sprintf.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'link.dart';

part 'place.g.dart';

part 'place.freezed.dart';

@freezed
class Place with _$Place {
  Place._();

  factory Place(
      @required @JsonKey(name: 'title') String name,
      @required double lat,
      @required double lon,
      @required String city,
      @required String address,
      [@Default([]) List<Link> links]) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  void showGoogleMap() {
    var url = sprintf(
        'https://www.google.com/maps/search/?api=1&query=%2.2f,%2.2f',
        [lat, lon]);
    launch(url);
  }

  void share() {
    Share.share(
        'I dined at $name in $city #dimsum #yumcha #talkdimsum talkdimsum.com',
        subject:  'title');
  }
}
