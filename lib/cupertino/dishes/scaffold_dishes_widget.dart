/* Technicat LLC */

import 'package:flutter/cupertino.dart';

import 'categories_widget.dart';

class ScaffoldDishesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Dishes'),
        ),
        child: CategoriesWidget());
  }
}
