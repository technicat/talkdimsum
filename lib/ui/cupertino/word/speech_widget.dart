import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/ui/common/word/chinese_text.dart';

import 'package:talkdimsum/ui/cupertino/tts/play_button.dart';
import 'package:talkdimsum/ui/cupertino/dish/practice_button.dart';

class SpeechWidget extends StatelessWidget {
  final Word word;

  SpeechWidget({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        PlayButton(word: word),
        ChineseText(word: word),
        PracticeButton(word: word)
      ]);
}
