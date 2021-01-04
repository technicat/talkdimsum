import 'package:flutter/material.dart';
import 'package:material_search/material_search.dart';
import 'package:provider/provider.dart';

import 'package:talkdimsum/core/dimsum.dart';
import 'package:talkdimsum/core/word.dart';
import 'package:talkdimsum/ui/material/dishes/word_dishes_widget.dart';

class SearchWordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DimSum>(builder: (context, dimsum, child) {
      //var words = DimSum.dishes.map((dish) => dish.words).expand((pair) => pair).toList();
      var words = dimsum.dishes.map((dish) => dish.words[0]).toList();
      words.addAll(dimsum.dishes
          .map((dish) => dish.tags)
          .expand((pair) => pair)
          .map((tag) => Word.words[tag])
          .where((word) => word != null));
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
                builder: (context) => WordDishesWidget(word: selected)),
          );
        },
        //),
      ));
    });
  }
}
