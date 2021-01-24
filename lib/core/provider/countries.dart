import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:talkdimsum/core/model/country.dart';

class Countries with ChangeNotifier {
  List<Country> countries = [];

  Countries() {
    _load();
  }

  void _load() async {
    final names = await rootBundle
        .loadString('assets/json/place/countries.json')
        .then((str) => List<String>.from(jsonDecode(str)));
    for (var filename in names) {
      countries.add(await Country.load('assets/json/place/', filename));
      notifyListeners();
    }
  }
}
