import 'package:flutter/material.dart';
import 'package:material_search/material_search.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/ui/material/dishes/word_dishes_scaffold.dart';

class SearchWordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DimSum>(builder: (context, dimsum, child) {
      var words = dimsum.dishWords;
      return Scaffold(
          body: //SingleChildScrollView(child:
              MaterialSearch<Word>(
        results: words
            .toSet()
            .map((word) => new MaterialSearchResult<Word>(
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
          var reg = new RegExp(r'' + crit + '');
          return value.english.toLowerCase().contains(reg) ||
              value.chineseText().contains(reg);
        },

        onSelect: (dynamic selected) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WordDishesScaffold(word: selected)),
          );
        },
        //),
      ));
    });
  }
}
