import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/ui/common/error_text.dart';

import 'category_dishes_grid.dart';

class CategoriesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return ref.watch(dimsumProvider).map(
          data: (_) => CategoryDishesGrid(dishes: _.value.categories),
          loading: (_) => LoadingText(),
          error: (_) => ErrorText(error: _.error));
    });
  }
}
