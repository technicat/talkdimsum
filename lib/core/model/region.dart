import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart' show rootBundle;

import 'place.dart';

class Region {
  final String name;
  //final double zoom;
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

  Region.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        //zoom = json['zoom'].toDouble(),
        places = List<Place>.from(
            json['places'].map((json) => Place.fromJson(json)));

  static loadPaths(List<String> paths) async {
    List<Region> list = [];
    for (var path in paths) {
      list.add(await load(path));
    }
    return list;
  }

  static Future<Region> load(String path) async {
    return rootBundle
        .loadString("assets/json/place/" + path + ".json")
        .then((str) => Region.fromJson(jsonDecode(str)));
  }
}
