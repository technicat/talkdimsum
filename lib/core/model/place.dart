import 'package:share/share.dart';
import 'package:sprintf/sprintf.dart';
import 'package:url_launcher/url_launcher.dart';

import 'link.dart';

import 'package:json_annotation/json_annotation.dart';

part 'place.g.dart';

@JsonSerializable()
class Place {
  @JsonKey(name: 'title', required: true)
  final String name;
  final double lat;
  final double lon;
  final String city;
  final String address;
  @JsonKey(defaultValue: [])
  final List<Link> links;

  Place(this.name, this.lat, this.lon, this.city, this.links, this.address);

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceToJson(this);

  String get googleMapURL {
    return sprintf(
        'https://www.google.com/maps/search/?api=1&query=%2.2f,%2.2f',
        [lat, lon]);
  }

  void showGoogleMap() {
    launch(googleMapURL);
  }

  void share() {
    Share.share(
        'I dined at $name in $city #dimsum #yumcha #talkdimsum talkdimsum.com',
        subject: 'Talk Dim Sum');
  }
}
