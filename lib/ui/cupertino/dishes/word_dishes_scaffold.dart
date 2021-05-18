import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/model/word.dart';

import 'word_dishes_grid.dart';

class WordDishesScaffold extends StatelessWidget {
  final Word word;

  WordDishesScaffold({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(word.display()),
      ),
      child: SafeArea(child: WordDishesGrid(word: word)));
}
