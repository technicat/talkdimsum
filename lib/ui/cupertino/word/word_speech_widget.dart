import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/ui/common/word/word_chinese_widget.dart';

import 'practice_button.dart';
import 'play_button.dart';

class WordSpeechWidget extends StatelessWidget {
  final Word word;

  WordSpeechWidget({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          PlayButton(word: word),
          WordChineseWidget(word: word),
          PracticeButton(word: word)
        ]);
  }
}


