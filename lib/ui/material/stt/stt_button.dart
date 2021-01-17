import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/core/provider/settings.dart';

import 'package:talkdimsum/core/provider/stt.dart';

class STTButton extends StatelessWidget {
  final Word word;

  STTButton({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(
        builder: (context, settings, child) => Consumer<STT>(
            builder: (context, stt, child) => stt.speech.isListening
                ? MaterialButton(
                    child: Icon(Icons.pause),
                    onPressed: () {
                      stt.stop();
                    },
                  )
                : MaterialButton(
                    child: Icon(Icons.mic),
                    onPressed: () {
                      stt.listen(word, settings.language);
                    },
                  )));
  }
}

