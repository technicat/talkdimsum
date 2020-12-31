import 'package:sprintf/sprintf.dart';

import 'link.dart';

class Place {
  final String name;
  final double lat;
  final double lon;
  final String city;
  final String address;
  final List<Link> links;

  Place(this.name, this.lat, this.lon, this.city, this.links, this.address);

  Place.fromJson(Map<String, dynamic> json)
      : name = json['title'],
        lat = json['lat'].toDouble(),
        lon = json['lon'].toDouble(),
        city = json['city'],
        links = json['links'] == null
            ? []
            : List<Link>.from(
            json['links'].map((json) => Link.fromJson(json))),
        address = json['address'];

  String get googleMapURL {
        return sprintf("https://www.google.com/maps/search/?api=1&query=%2.2f,%2.2f",
        [lat,lon]);
  }

        
}
