import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/word.dart';

import 'package:talkdimsum/ui/common/word/pronounce_text.dart';
import 'package:talkdimsum/ui/common/word/english_text.dart';

import 'package:talkdimsum/ui/cupertino/word/word_speech_widget.dart';


class DishWordWidget extends StatelessWidget {
  final Word word;

  DishWordWidget({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      EnglishText(word: word),
      WordSpeechWidget(word: word),
      PronounceText(word: word)
    ]);
  }
}

