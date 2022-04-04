import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'region.dart';

class Country {
  final String name;

  List<Region> regions = [];

  Country(this.name);

  static Future<Country> load(String path, String filename) async {
    final json = await rootBundle
        .loadString(path + filename + '.json')
        .then((str) => jsonDecode(str));
    final country = Country(json['name']);
    country.regions =
        await Region.loadPaths(path, List<String>.from(json['regions']));
    return country;
  }
}
