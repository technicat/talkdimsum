import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'word.dart';

class Line {
  final String name;
  final List<Word> words;

  Line(this.name, this.words);

  Line.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        words =
            List<Word>.from(json['words'].map((json) => Word.fromJson(json)));
}

class Phrases {
  final String name;
  final List<Line> lines;

  Phrases(this.name, this.lines);

  Phrases.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        lines =
            List<Line>.from(json['lines'].map((json) => Line.fromJson(json)));

  static Future<Phrases> loadPhraseList(String path) async {
    var phrases = await rootBundle
        .loadString('assets/json/phrases/' + path + '.json')
        .then((str) => Phrases.fromJson(jsonDecode(str)));
    return phrases;
  }
}
