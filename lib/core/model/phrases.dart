import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'line.dart';

//import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'phrases.g.dart';
part 'phrases.freezed.dart';

//@JsonSerializable()
@freezed
class Phrases with _$Phrases {
  Phrases._();
  /*{
  final String name;
  final List<Line> lines; 

  Phrases(this.name, this.lines); */

  factory Phrases(@required String name, @required List<Line> lines) = _Phrases;

  factory Phrases.fromJson(Map<String, dynamic> json) =>
      _$PhrasesFromJson(json);

//  Map<String, dynamic> toJson() => _$PhrasesToJson(this);

  static Future<Phrases> loadPhraseList(String path) async => await rootBundle
      .loadString(path + '.json')
      .then((str) => Phrases.fromJson(jsonDecode(str)));
}
