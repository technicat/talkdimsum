import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';

import 'category_dishes_grid.dart';

class CategoriesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      var dimsum = watch(dimsumProvider);
      return dimsum.map(
          data: (_) => CategoryDishesGrid(dishes: _.value.categories),
          loading: (_) => CupertinoActivityIndicator(),
          error: (_) => Text(
                _.error.toString(),
                style: TextStyle(color: CupertinoColors.destructiveRed),
              ));
    });
  }
}
