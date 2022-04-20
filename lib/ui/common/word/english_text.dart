import 'package:flutter/widgets.dart';
import 'package:talkdimsum/core/model/word.dart';

class EnglishText extends StatelessWidget {
  final Word word;

  EnglishText({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) => Text('${word.english}',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
}
