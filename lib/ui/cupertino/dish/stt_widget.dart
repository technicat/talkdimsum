import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/word.dart';

import 'stt_button.dart';

class STTWidget extends StatelessWidget {
  final Word word;

  STTWidget({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        STTStatusText(),
        STTText(),
        STTButton(word: word)
    ]
    );
  }
}
