/* Technicat LLC */

import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/dimsum.dart';

import 'phrases_list_widget.dart';

class ScaffoldPhrasesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DimSum>(builder: (context, dimsum, child) {
      dimsum.loadPhrases();
      return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('Phrases'),
          ),
          child: dimsum.phrases.isEmpty
              ? Text('Loading phrases...')
              : PhrasesListWidget(phrases: dimsum.phrases[0]));
    });
  }
}
