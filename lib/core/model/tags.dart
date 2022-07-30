import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'word.dart';

// rename this?
class Tags {
  static const pre = 'assets/json/words/';

  static List<Word> words = [];

  static void load() async {
    var categories = await rootBundle
        .loadString('assets/json/words/words.json')
        .then((str) => List<String>.from(jsonDecode(str)));
    var dishlists = categories.map((json) => loadWords(json));
    for (var list in dishlists) {
      words.addAll(await list);
    }
    for (var word in words) {
      Word.add(word);
    }
  }

  static Future<List<Word>> loadWords(String path) async {
    var words = await rootBundle.loadString(pre + path + '.json').then((str) =>
        List<Word>.from(jsonDecode(str).map((json) => Word.fromJson(json))));
    return words;
  }
}
