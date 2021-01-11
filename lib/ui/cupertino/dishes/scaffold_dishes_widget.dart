/* Technicat LLC */

import 'package:flutter/cupertino.dart';

import 'categories_widget.dart';

class ScaffoldDishesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        // resizeToAvoidBottomInset: true,
        navigationBar: CupertinoNavigationBar(
          //  transitionBetweenRoutes: true,
          middle: Text('Dishes'),
        ),
        child: SafeArea(child: CategoriesWidget()));
  }
}
