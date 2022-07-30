import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';

import 'package:talkdimsum/ui/common/error_text.dart';

import 'category_dishes_grid.dart';

import '../progress.dart';

class CategoriesGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Consumer(builder: (context, ref, child) {
      var dimsum = ref.watch(dimsumProvider);
      return dimsum.map(
          data: (_) => CategoryDishesGrid(dishes: _.value.categories),
          loading: (_) => Progressor(),
          error: (_) => ErrorText(error: _.error));
    });
  }

