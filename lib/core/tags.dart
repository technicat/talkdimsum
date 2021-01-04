import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'word.dart';

// rename this?
class Tags {

  static const Path = 'assets/json/words/';

  static List<Word> words = [];


  static load() async {
      var categories = await rootBundle.loadString("assets/json/words/words.json").then((str) =>
        List<String>.from(jsonDecode(str)));
      var dishlists = categories.map((json) => loadWords(json));
      for (var list in dishlists) {
        words.addAll(await list);
      }
      words.forEach((word) => Word.add(word));
  }

  static Future<List<Word>> loadWords(String path) async {
    var words = await rootBundle.loadString(Path+path+'.json').then((str) =>
        List<Word>.from(jsonDecode(str).map((json) => Word.fromJson(json))));
   // words.removeWhere((dish) => dish.ignore);
    return words;
  }
}

