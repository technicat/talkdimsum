import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/word.dart';

import 'package:talkdimsum/ui/common/word/word_pronounce_widget.dart';
import 'package:talkdimsum/ui/common/word/word_english_widget.dart';

import 'package:talkdimsum/ui/cupertino/dish/word_speech_widget.dart';


class DishWordWidget extends StatelessWidget {
  final Word word;

  DishWordWidget({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      WordEnglishWidget(word: word),
      WordSpeechWidget(word: word),
      WordPronounceWidget(word: word)
    ]);
  }
}

