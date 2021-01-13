import 'package:flutter/material.dart';

import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/core/util/tts.dart';
import 'package:talkdimsum/core/provider/settings.dart';

import 'package:talkdimsum/ui/common/word/word_chinese_widget.dart';
import 'package:talkdimsum/ui/common/word/word_english_widget.dart';
import 'package:talkdimsum/ui/common/word/word_pronounce_widget.dart';

import 'package:talkdimsum/ui/material/word/play_widget.dart';

import 'practice_widget.dart';

class DishWordWidget extends StatelessWidget {
  final Word word;

  DishWordWidget({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      WordEnglishWidget(word:word),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
        PlayWidget(word:word),
        WordChineseWidget(word:word),
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
      WordPronounceWidget(word:word)
    ]);
  }
}
