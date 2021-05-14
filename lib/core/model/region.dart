import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart' show rootBundle;

import 'place.dart';

import 'package:json_annotation/json_annotation.dart';

part 'region.g.dart';

@JsonSerializable()
class Region {
  @JsonKey(required: true)
  final String name;
  //final double zoom;
  @JsonKey(defaultValue: [])
  final List<Place> places;

  double get minzoom {
    return min(latzoom, lonzoom);
  }

  double get latzoom {
    var len = latlen;
    return len == 0 ? 15 : 9.0 / len;
  }

  double get lonzoom {
    var len = lonlen;
    return len == 0 ? 15 : 8.0 / len;
  }

  double get latlen {
    return latmax - latmin;
  }

  double get lonlen {
    return lonmax - lonmin;
  }

  double get lat {
    return (latmin + latmax) / 2;
  }

  double get lon {
    return (lonmin + lonmax) / 2;
  }

  double get latmin {
    return places.map((place) => place.lat).reduce((a, b) => min(a, b));
  }

  double get lonmin {
    return places.map((place) => place.lon).reduce((a, b) => min(a, b));
  }

  double get latmax {
    return places.map((place) => place.lat).reduce((a, b) => max(a, b));
  }

  double get lonmax {
    return places.map((place) => place.lon).reduce((a, b) => max(a, b));
  }

  Region(this.name, this.places);

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  //Map<String, dynamic> toJson() => _$RegionToJson(this);

  static Future<List<Region>> loadPaths(
      String path, List<String> filenames) async {
    //return filenames.map((filename) => _load(path+filename)).toList();
    List<Region> list = [];
    for (var filename in filenames) {
      list.add(await _load(path + filename));
    }
    return list;
  }

  static Future<Region> _load(String path) async {
    return rootBundle
        .loadString(path + '.json')
        .then((str) => Region.fromJson(jsonDecode(str)));
  }
}
