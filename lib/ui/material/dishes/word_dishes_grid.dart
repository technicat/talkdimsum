import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/ui/common/error_text.dart';

import 'dishes_grid.dart';

import '../progress.dart';

class WordDishesGrid extends StatelessWidget {
  final Word word;

  WordDishesGrid({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      var dimsum = watch(dimsumProvider);
      return dimsum.map(
          data: (_) => DishesGrid(dishes: _.value.dishes(word)),
          loading: (_) => Progress(),
          error: (_) => ErrorText(error: _.error));
    });
  }
}
