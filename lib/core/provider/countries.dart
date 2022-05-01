import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/model/country.dart';

final countryProvider = FutureProvider((ref) async {
  var con = Countries();
  await con.load();
  return con;
});

class Countries with ChangeNotifier {
  List<Country> countries = [];

  load() async {
    final names = await rootBundle
        .loadString('assets/json/place/countries.json')
        .then((str) => List<String>.from(jsonDecode(str)));
    for (var filename in names) {
      countries.add(await Country.load('assets/json/place/', filename));
      //   notifyListeners();
    }
  }
}
