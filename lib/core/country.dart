import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'region.dart';

import 'package:flutter/foundation.dart' show ChangeNotifier;

class Country {
  final String name;

  List<Region> regions = [];

  Country(this.name);

  static load(String path) async {
    var json = await rootBundle
        .loadString("assets/json/place/" + path + ".json")
        .then((str) => jsonDecode(str));
    var country = Country(json['name']);
    country.regions =
        await Region.loadPaths(List<String>.from(json['regions']));
    return country;
  }
}

class Countries with ChangeNotifier {
List<Country> countries = [];

Countries() {
  _load();
}

  _load() async {
    var names = await rootBundle
        .loadString("assets/json/place/countries.json")
        .then((str) => List<String>.from(jsonDecode(str)));
    for (var name in names) {
      countries.add(await Country.load(name));
    }
    notifyListeners();
  }
}