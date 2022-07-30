import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/core/provider/settings.dart';

class ChineseText extends StatelessWidget {
  final Word word;

  ChineseText({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(
        builder: (context, settings, child) => ExcludeSemantics(
            child: Text(word.chineseText(settings.language),
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24))));
  }
}
