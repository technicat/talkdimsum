import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/core/provider/tts.dart';
import 'package:talkdimsum/core/provider/settings.dart';

class PlayButton extends StatelessWidget {
  final Word word;

  PlayButton({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(builder: (context, settings, child) {
      return Consumer<TTS>(builder: (context, tts, child) {
        return IconButton(
            icon: Icon(Icons.volume_up,
                semanticLabel: 'Hear how this dish is pronounced in Chinese'),
            tooltip: 'Hear how this dish is pronounced in Chinese',
            onPressed: () => tts.say(word, settings.language, settings.speed));
      });
    });
  }
}
