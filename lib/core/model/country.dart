import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'region.dart';

class Country {
  final String name;

  List<Region> regions = [];

  Country(this.name);

  static Future<Country> load(String path) async {
    var json = await rootBundle
        .loadString(path + '.json')
        .then((str) => jsonDecode(str));
    var country = Country(json['name']);
    country.regions =
        await Region.loadPaths(List<String>.from(json['regions']));
    return country;
  }
}
