import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/ui/common/word/chinese_text.dart';

import 'package:talkdimsum/ui/cupertino/tts/play_button.dart';
import 'package:talkdimsum/ui/cupertino/stt/practice_button.dart';

class WordSpeechWidget extends StatelessWidget {
  final Word word;

  WordSpeechWidget({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          PlayButton(word: word),
          ChineseText(word: word),
          PracticeButton(word: word)
        ]);
  }
}


