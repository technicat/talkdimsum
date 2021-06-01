import 'package:flutter/material.dart';

import 'package:talkdimsum/core/model/word.dart';

import 'word_dishes_grid.dart';

class WordDishesScaffold extends StatelessWidget {
  final Word word;

  WordDishesScaffold({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(word.display()),
      ),
      body: WordDishesGrid(word: word));
}
