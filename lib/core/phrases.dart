import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'word.dart';

class Line {
   final String name;
    final List<Word> words;

     Line(this.name, this.words);

  Line.fromJson(Map<String, dynamic> json) :
        name = json['name'],
        words = List<Word>.from(
            json['words'].map((json) => Word.fromJson(json)));
}

class Phrases {

	static List<Phrases> phrases = [];

  final String name;
  final List<Line> lines;

  Phrases(this.name, this.lines);

  Phrases.fromJson(Map<String, dynamic> json) :
        name = json['name'],
        lines = List<Line>.from(
            json['lines'].map((json) => Line.fromJson(json)));

  static load() async {
      var categories = await rootBundle.loadString("assets/json/phrases/phrases.json").then((str) =>
        List<String>.from(jsonDecode(str)));
      var dishlists = categories.map((json) => loadPhraseList(json));
      for (var list in dishlists) {
        phrases.add(await list);
      }
      // phrases.forEach((dish) => dish.words.forEach((word) => Word.add(word)));
  }

  static Future<Phrases> loadPhraseList(String path) async {
    var phrases = await rootBundle.loadString('assets/json/phrases/'+path+'.json').then((str) =>
        Phrases.fromJson(jsonDecode(str)));
    return phrases;
  }
    
}

