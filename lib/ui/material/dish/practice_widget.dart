import 'package:flutter/material.dart';

import 'package:talkdimsum/core/model/word.dart';

import 'package:talkdimsum/ui/common/word/chinese_text.dart';
import 'package:talkdimsum/ui/common/word/pronounce_text.dart';

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
          ChineseText(word: word),
          PronounceText(word:word)
        ]));
  }
}
