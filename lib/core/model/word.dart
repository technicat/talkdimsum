import 'dart:collection';

import 'package:talkdimsum/core/model/language.dart';

import 'link.dart';

import 'package:json_annotation/json_annotation.dart';

part 'word.g.dart';

@JsonSerializable()
class Word {
  static HashMap<String, Word> words = HashMap<String, Word>();

  static Word add(Word word) {
    Word.words[word.cantonese] = word;
    return word;
  }

  @JsonKey(name: 'Chinese')
  final String cantonese;
  @JsonKey(name: 'Mandarin')
  final String? mandarin;
  @JsonKey(name: 'Simplified')
  final String? simplified;
  @JsonKey(name: 'English')
  final String english;
  @JsonKey(name: 'Yale')
  final String yale;
  @JsonKey(name: 'Pinyin')
  final String pinyin;
  @JsonKey(name: 'Resources')
  final List<Link>? resources;

  Word(this.cantonese, this.mandarin, this.simplified, this.english, this.yale,
      this.pinyin, this.resources);

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  Map<String, dynamic> toJson() => _$WordToJson(this);

  String chineseText([Chinese lang = Chinese.Cantonese]) {
    // assert(cantonese != null, 'word for $english has no Cantonese!');
    switch (lang) {
      case Chinese.Cantonese:
        return cantonese;
      case Chinese.Mandarin:
        return mandarin ?? cantonese;
      case Chinese.Simplified:
        return simplified ?? mandarin ?? cantonese;
      default:
        return cantonese;
    }
  }

  String get id {
    // assert(cantonese != null, 'word for $english has no Cantonese!');
    return cantonese;
  }

  String pronunciation([Chinese lang = Chinese.Cantonese]) {
    //assert(yale != null, 'word for $english has no Yale!');
    //assert(pinyin != null, 'word for $english has no Pinyin!');
    switch (lang) {
      case Chinese.Cantonese:
        return yale;
      case Chinese.Mandarin:
        return pinyin;
      case Chinese.Simplified:
        return pinyin;
      default:
        return yale;
    }
  }

  String display() {
    return '$english ${chineseText(Chinese.Cantonese)}';
  }
}
