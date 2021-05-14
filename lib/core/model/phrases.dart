import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'line.dart';

import 'package:json_annotation/json_annotation.dart';

part 'phrases.g.dart';

@JsonSerializable()
class Phrases {
  final String name;
  final List<Line> lines;

  Phrases(this.name, this.lines);

  factory Phrases.fromJson(Map<String, dynamic> json) => _$PhrasesFromJson(json);

//  Map<String, dynamic> toJson() => _$PhrasesToJson(this);

  static Future<Phrases> loadPhraseList(String path) async {
    var phrases = await rootBundle
        .loadString(path + '.json')
        .then((str) => Phrases.fromJson(jsonDecode(str)));
    return phrases;
  }
}
