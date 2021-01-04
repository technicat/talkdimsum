/* Technicat LLC */

import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';

import 'phrases_list_widget.dart';

class ScaffoldPhrasesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Phrases'),
        ),
        child: Consumer<DimSum>(builder: (context, dimsum, child) {
          return dimsum.phrases.isEmpty
              ? Text('Loading phrases...')
              : PhrasesListWidget(phrases: dimsum.phrases[0]);
        }));
  }
}
