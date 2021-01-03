/* Technicat LLC */

import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/dimsum.dart';

import 'phrases_list_widget.dart';

class ScaffoldPhrasesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Phrases'),
        ),
        child: PhrasesListWidget(phrases: DimSum.phrases[0]));
  }
}
