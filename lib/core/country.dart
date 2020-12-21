import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'region.dart';

class Country {

  static List<Country> countries = [];

  final String name;
  List<Region> regions = [];

   Country(
      this.name);

   static load(String path) async {
      var json = await rootBundle.loadString("assets/json/place/"+path+".json").then((str) => jsonDecode(str));
      var country = Country(json['name']);
      country.regions = await Region.loadPaths(List<String>.from(json['regions']));
      return country;
  }

  static loadList() async {
      var names = await rootBundle.loadString("assets/json/place/countries.json").then((str) =>
        List<String>.from(jsonDecode(str)));
      for (var name in names) {
        countries.add(await load(name));
      }
  }

 
}

