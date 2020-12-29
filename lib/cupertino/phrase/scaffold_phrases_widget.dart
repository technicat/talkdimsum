/* Technicat LLC */

import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/phrases.dart';

import 'phrases_list_widget.dart';

class ScaffoldPhrasesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Phrases'),
        ),
        child: PhrasesListWidget(phrases: Phrases.phrases[0]));
  }
}
