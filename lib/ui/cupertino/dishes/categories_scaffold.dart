/* Technicat LLC */

import 'package:flutter/cupertino.dart';

import 'categories_grid.dart';

class CategoriesScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        // resizeToAvoidBottomInset: true,
        navigationBar: CupertinoNavigationBar(
          //  transitionBetweenRoutes: true,
          middle: Text('Dishes'),
        ),
        child: SafeArea(child: CategoriesGrid()));
  }
}
