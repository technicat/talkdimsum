import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/core/provider/settings.dart';

class PronounceText extends StatelessWidget {
  final Word word;

  PronounceText({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(
        builder: (context, settings, child) => ExcludeSemantics(
            child: Text(word.pronunciation(settings.language),
                textAlign: TextAlign.center, style: TextStyle(fontSize: 20))));
  }
}
