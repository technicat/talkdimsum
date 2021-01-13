import 'package:flutter/material.dart';

import 'package:talkdimsum/core/model/word.dart';

import 'package:talkdimsum/ui/common/word/word_chinese_widget.dart';
import 'package:talkdimsum/ui/common/word/word_pronounce_widget.dart';

import 'package:talkdimsum/ui/material/speech/language_dropdown.dart';
import 'package:talkdimsum/ui/material/speech/speed_slider.dart';

import 'package:talkdimsum/ui/material/word/play_widget.dart';

class PracticeWidget extends StatelessWidget {
  final Word word;

  PracticeWidget({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('${word.english}')),
        body: Column(children: <Widget>[
          LanguageDropdown(),
          SpeedSlider(),
          PlayWidget(word:word),
          WordChineseWidget(word: word),
          WordPronounceWidget(word:word)
        ]));
  }
}
