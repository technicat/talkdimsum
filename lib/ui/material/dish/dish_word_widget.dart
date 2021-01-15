import 'package:flutter/material.dart';

import 'package:talkdimsum/core/model/word.dart';

import 'package:talkdimsum/ui/common/word/chinese_text.dart';
import 'package:talkdimsum/ui/common/word/english_text.dart';
import 'package:talkdimsum/ui/common/word/pronounce_text.dart';

import 'package:talkdimsum/ui/material/word/play_widget.dart';

import 'practice_widget.dart';

class DishWordWidget extends StatelessWidget {
  final Word word;

  DishWordWidget({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      EnglishText(word:word),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        PlayWidget(word:word),
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
