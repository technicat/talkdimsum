import 'package:flutter/widgets.dart';

import 'package:talkdimsum/core/model/word.dart';

class WordEnglishWidget extends StatelessWidget {
  final Word word;

  WordEnglishWidget({Key key, @required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('${word.english}',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }
}

