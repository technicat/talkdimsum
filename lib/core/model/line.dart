import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'word.dart';

part 'line.g.dart';

part 'line.freezed.dart';

@freezed
class Line with _$Line {
  Line._();

  factory Line(@required String name, @required List<Word> words) = _Line;

  factory Line.fromJson(Map<String, dynamic> json) => _$LineFromJson(json);
}
