import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'line.dart';

import 'package:json_annotation/json_annotation.dart';

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
        .loadString(path + '.json')
        .then((str) => Phrases.fromJson(jsonDecode(str)));
    return phrases;
  }
}
