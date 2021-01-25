import 'package:flutter/cupertino.dart';
import 'package:material_search/material_search.dart'; // need cupertino version
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/ui/material/dishes/word_dishes_scaffold.dart';

class SearchWordScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DimSum>(builder: (context, dimsum, child) {
      var words = dimsum.dishWords;
      return CupertinoPageScaffold(
          child: //SingleChildScrollView(child:
              MaterialSearch<Word>(
        results: words
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
            return dimsum.categories.contains(value.id);
          }
          var reg = RegExp(r'' + crit + '');
          return value.english.toLowerCase().contains(reg) ||
              value.chineseText().contains(reg);
        },

        onSelect: (dynamic selected) {
          Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => WordDishesScaffold(word: selected)),
          );
        },
        //),
      ));
    });
  }
}
