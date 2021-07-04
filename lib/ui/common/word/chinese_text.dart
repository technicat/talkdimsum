import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:substring_highlight/substring_highlight.dart';

import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/core/provider/settings.dart';

class ChineseText extends StatelessWidget {
  final Word word;

  ChineseText({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(
        builder: (context, settings, child) => ExcludeSemantics(
            child: SelectableText(word.chineseText(settings.language),
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24))));
  }
}

class HighlightChineseText extends StatelessWidget {
  final Word word;

  HighlightChineseText({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(
        builder: (context, settings, child) => Directionality(
            textDirection: TextDirection.ltr,
            child: SubstringHighlight(
                text: '${word.chineseText(settings.language)}',
                term: '',
                textAlign: TextAlign.center,
                textStyle: TextStyle(fontSize: 24))));
  }
}
