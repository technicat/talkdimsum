import 'package:flutter/cupertino.dart';
import 'package:cupertino_search/cupertino_search.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/ui/common/error_text.dart';

import 'word_dishes_scaffold.dart';

class SearchWordScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      CupertinoPageScaffold(child: SearchWord());
}

class SearchWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      var dimsum = ref.watch(dimsumProvider);
      return dimsum.map(
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
              onSelect: (dynamic selected) =>
                  Get.to(() => WordDishesScaffold(word: selected))),
          loading: (_) => LoadingText(),
          error: (_) => ErrorText(error: _.error));
    });
  }
}
