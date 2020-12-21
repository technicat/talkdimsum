import 'link.dart';

class Place {
  final String name;
  final double lat;
  final double lon;
  final String city;
  final String address;
  final List<Link> links;
  // Region region;

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
}
