/*
 Technicat LLC 
 Entry point for Talk Dim Sum
*/
import 'package:auto_route/auto_route_annotations.dart';

import 'navigation_bar.dart';
import 'dishes/dishes_grid.dart';
import 'dishes/word_dishes_scaffold.dart';
import 'dishes/categories_scaffold.dart';
import 'dishes/search_word_scaffold.dart';
import 'dish/dish_scaffold.dart';
import 'dish/practice_widget.dart';
import 'place/region_scaffold.dart';

@CupertinoAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: NavigationBar,initial:true),
    AutoRoute(page: WordDishesScaffold),
    AutoRoute(page: DishesGrid),
    AutoRoute(page: DishScaffold),
    AutoRoute(page: PracticeWidget),
    AutoRoute(page: CategoriesScaffold),
    AutoRoute(page: SearchWordScaffold),
    AutoRoute(page: RegionScaffold),
  ],
)
class $AppRouter {}

