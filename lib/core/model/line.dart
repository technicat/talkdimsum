import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'word.dart';


part 'line.g.dart';

part 'line.freezed.dart';

//@JsonSerializable()
@freezed
class Line with _$Line {
  Line._();
  
 // String name;
 // final List<Word> words;

  factory Line(
  @required String name,
  @required List<Word> words) = _Line;

  //Line(this.name, this.words);

  factory Line.fromJson(Map<String, dynamic> json) => _$LineFromJson(json);

  //Map<String, dynamic> toJson() => _$LineToJson(this);
}

