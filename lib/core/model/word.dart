import 'dart:collection';

import 'package:talkdimsum/core/model/language.dart';

import 'link.dart';

class Word {
  static HashMap<String, Word> words = HashMap<String, Word>();

  static Word add(Word word) {
    Word.words[word.cantonese] = word;
    return word;
  }

  final String cantonese;
  final String mandarin;
  final String simplified;
  final String english;
  final String yale;
  final String pinyin;
  final List<Link> resources;

  Word(this.cantonese, this.mandarin, this.simplified, this.english, this.yale,
      this.pinyin, this.resources);

  Word.fromJson(Map<String, dynamic> json)
      : cantonese = json['Chinese'],
        mandarin = json['Mandarin'],
        simplified = json['Simplified'],
        english = json['English'],
        yale = json['Yale'],
        pinyin = json['Pinyin'],
        resources = json['Resources'] == null
            ? []
            : List<Link>.from(
                json['Resources'].map((json) => Link.fromJson(json)));

  String chineseText([Chinese lang = Chinese.Cantonese]) {
    assert(cantonese != null, 'word for $english has no Cantonese!');
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
    assert(cantonese != null, 'word for $english has no Cantonese!');
    return cantonese;
  }

  String pronunciation([Chinese lang = Chinese.Cantonese]) {
    assert(yale != null, 'word for $english has no Yale!');
    assert(pinyin != null, 'word for $english has no Pinyin!');
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
