import 'package:flutter/material.dart';
import 'package:material_search/material_search.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/core/model/word.dart';

import 'package:talkdimsum/ui/common/error_text.dart';

import 'word_dishes_scaffold.dart';

import '../progress.dart';

class SearchWordScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SearchWord());
  }
}

class SearchWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      var dimsum = watch(dimsumProvider);
      return dimsum.map(
          data: (_) => MaterialSearch<Word>(
              results: _.value.dishWords
                  .toSet()
                  .map((word) => MaterialSearchResult<Word>(
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WordDishesScaffold(word: selected)),
                );
              }),
          loading: (_) => Progress(),
          error: (_) => ErrorText(error: _.error));
    });
  }
}
