/*
 Technicat LLC 
 Entry point for Talk Dim Sum
*/
import 'package:auto_route/auto_route_annotations.dart';

import 'navigation_bar.dart';
import 'dishes/dishes_grid.dart';
import 'dishes/word_dishes_scaffold.dart';

@CupertinoAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: NavigationBar,initial:true),
    AutoRoute(page: WordDishesScaffold),
    AutoRoute(page: DishesGrid),
  ],
)
class $AppRouter {}

