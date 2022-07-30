import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/core/provider/settings.dart';

import 'package:talkdimsum/core/provider/stt.dart';

class STTButton extends StatelessWidget {
  final Word word;

  STTButton({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(
        builder: (context, settings, child) => Consumer<STT>(
            builder: (context, stt, child) => stt.status == STTStatus.listening
                ? CupertinoButton(
                    onPressed: () => stt.stop(),
                    child: Icon(CupertinoIcons.pause,
                        semanticLabel: 'Stop listening to me'),
                  )
                : CupertinoButton(
                    onPressed: () => stt.listen(word, settings.language),
                    child: Icon(CupertinoIcons.mic,
                        semanticLabel: 'Start listening to me'),
                  )));
  }
}
