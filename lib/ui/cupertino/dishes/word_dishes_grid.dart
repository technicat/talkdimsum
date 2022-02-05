import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/ui/common/error_text.dart';

import 'dishes_grid.dart';

class WordDishesGrid extends StatelessWidget {
  final Word word;

  WordDishesGrid({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer(
      builder: (context, ref, child) => ref.watch(dimsumProvider).map(
          data: (_) => DishesGrid(dishes: _.value.dishes(word)),
          loading: (_) => LoadingText(),
          error: (_) => ErrorText(error: _.error)));
}
