import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/dimsum.dart';

import 'category_dishes_widget.dart';

class CategoriesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DimSum>(builder: (context, dimsum, child) =>
      CategoryDishesWidget(dishes: dimsum.categories)
    );
  }
}