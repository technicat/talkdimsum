import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/word.dart';

import 'stt_button.dart';

class STTWidget extends StatelessWidget {
  final Word word;

  STTWidget({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
        /*  return if (stt.lastWords == widget.word.chineseText(settings.language))
            Text('You got it!',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
          if (!widget.word.chineseText(settings.language).startsWith(lastWords))
            Text('Wrong!',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24))
           
          Text('$lastWords',
              textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
          Spacer(), */
        STTButton(word: word)
    ]
    );
  }
}
