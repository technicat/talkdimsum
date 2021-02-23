/*
 Technicat LLC 
 Entry point for Talk Dim Sum
*/
import 'package:auto_route/auto_route_annotations.dart';

import 'navigation_bar.dart';
import 'dishes/word_dishes_scaffold.dart';

@CupertinoAutoRouter(
  //replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: NavigationBar,initial:true),
    AutoRoute(page: WordDishesScaffold),
  ],
)
class $AppRouter {}

