import 'package:flutter/widgets.dart';

import 'package:talkdimsum/core/model/word.dart';

import 'package:talkdimsum/ui/common/word/pronounce_text.dart';
import 'package:talkdimsum/ui/common/word/english_text.dart';

import 'package:talkdimsum/ui/cupertino/word/speech_widget.dart';

class WordWidget extends StatelessWidget {
  final Word word;

  WordWidget({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
        EnglishText(word: word),
        SpeechWidget(word: word),
        PronounceText(word: word)
      ]);
}
