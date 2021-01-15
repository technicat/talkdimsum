/* Technicat LLC */

import 'package:flutter/cupertino.dart';

import 'phrases_widget.dart';

class PhrasesScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Phrases'),
        ),
        child: PhrasesWidget());
  }
}

