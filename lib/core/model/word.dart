import 'dart:collection';
import 'package:talkdimsum/core/model/language.dart';
import 'package:json_annotation/json_annotation.dart';
import 'link.dart';

part 'word.g.dart';

@JsonSerializable()
class Word {
  static HashMap<String, Word> words = HashMap<String, Word>();

  static Word add(Word word) {
    Word.words[word.cantonese] = word;
    return word;
  }

  @JsonKey(name: 'Chinese', required: true)
  final String cantonese;
  @JsonKey(name: 'Mandarin')
  final String? mandarin;
  @JsonKey(name: 'Simplified')
  final String? simplified;
  @JsonKey(name: 'English', required: true)
  final String english;
  @JsonKey(name: 'Yale', required: true)
  final String yale;
  @JsonKey(name: 'Jyutping')
  final String? jyutping;
  @JsonKey(name: 'Pinyin', required: true)
  final String pinyin;
  @JsonKey(name: 'resources', defaultValue: [])
  final List<Link> resources;

  Word(this.cantonese, this.mandarin, this.simplified, this.english, this.yale,
      this.jyutping, this.pinyin, this.resources);

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  String chineseText([Chinese lang = Chinese.cantonese]) {
    switch (lang) {
      case Chinese.cantonese:
        return cantonese;
      case Chinese.mandarin:
        return mandarin ?? cantonese;
      case Chinese.simplified:
        return simplified ?? mandarin ?? cantonese;
      default:
        return cantonese;
    }
  }

  String get id {
    return cantonese;
  }

  String pronunciation([Chinese lang = Chinese.cantonese]) {
    switch (lang) {
      case Chinese.cantonese:
        return yale; // todo - add switch for jyutping
      case Chinese.mandarin:
        return pinyin;
      case Chinese.simplified:
        return pinyin;
      default:
        return yale;
    }
  }

  String display() => '$english ${chineseText(Chinese.cantonese)}';
}
