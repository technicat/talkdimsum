import 'package:flutter/material.dart';

import 'package:talkdimsum/core/model/word.dart';

import 'package:talkdimsum/ui/common/word/chinese_text.dart';
import 'package:talkdimsum/ui/common/word/english_text.dart';
import 'package:talkdimsum/ui/common/word/pronounce_text.dart';

import 'package:talkdimsum/ui/material/tts/play_button.dart';

import '../dish/practice_widget.dart';

class WordWidget extends StatelessWidget {
  final Word word;

  WordWidget({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      EnglishText(word:word),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        PlayButton(word:word),
        ChineseText(word:word),
        IconButton(
          icon: Icon(Icons.mic),
          tooltip: 'Play and practice this word',
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PracticeWidget(word: word)));
          },
        ),
      ]),
      PronounceText(word:word)
    ]);
  }
}
