import 'package:flutter/cupertino.dart';
import 'package:cupertino_search/cupertino_search.dart'; 
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/core/model/word.dart';

import '../router.gr.dart';

class SearchWordScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(child: SearchWord());
  }
}

class SearchWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      return watch(dimsumProvider).map(
          data: (_) => CupertinoSearch<Word>(
              results: _.value.dishWords
                  .toSet()
                  .map((word) => CupertinoSearchResult<Word>(
                        value: word,
                        text: word.display(), // English,
                        //icon: Icons.person,
                      ))
                  .toList(),
              filter: (dynamic value, String criteria) {
                var crit = criteria.toLowerCase().trim();
                if (crit.isEmpty) {
                  return _.value.categories.contains(value.id);
                }
                var reg = RegExp(r'' + crit + '');
                return value.english.toLowerCase().contains(reg) ||
                    value.chineseText().contains(reg);
              },
              onSelect: (dynamic selected) {
                Navigator.pushNamed(
                  context,
                  Routes.wordDishesScaffold,
                  arguments: WordDishesScaffoldArguments(word: selected),
                );
              }),
          loading: (_) => CupertinoActivityIndicator(),
          error: (_) => Text(
                _.error.toString(),
                style: TextStyle(color: CupertinoColors.destructiveRed),
              ));
    });
  }
}
