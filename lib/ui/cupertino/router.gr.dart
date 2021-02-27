// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../core/model/dish.dart';
import '../../core/model/region.dart';
import '../../core/model/word.dart';
import 'dish/dish_scaffold.dart';
import 'dish/practice_widget.dart';
import 'dishes/categories_scaffold.dart';
import 'dishes/dishes_grid.dart';
import 'dishes/search_word_scaffold.dart';
import 'dishes/word_dishes_scaffold.dart';
import 'place/region_scaffold.dart';

class Routes {
  static const String wordDishesScaffold = '/word-dishes-scaffold';
  static const String dishesGrid = '/dishes-grid';
  static const String dishScaffold = '/dish-scaffold';
  static const String practiceWidget = '/practice-widget';
  static const String categoriesScaffold = '/categories-scaffold';
  static const String searchWordScaffold = '/search-word-scaffold';
  static const String regionScaffold = '/region-scaffold';
  static const all = <String>{
    wordDishesScaffold,
    dishesGrid,
    dishScaffold,
    practiceWidget,
    categoriesScaffold,
    searchWordScaffold,
    regionScaffold,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.wordDishesScaffold, page: WordDishesScaffold),
    RouteDef(Routes.dishesGrid, page: DishesGrid),
    RouteDef(Routes.dishScaffold, page: DishScaffold),
    RouteDef(Routes.practiceWidget, page: PracticeWidget),
    RouteDef(Routes.categoriesScaffold, page: CategoriesScaffold),
    RouteDef(Routes.searchWordScaffold, page: SearchWordScaffold),
    RouteDef(Routes.regionScaffold, page: RegionScaffold),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    WordDishesScaffold: (data) {
      final args = data.getArgs<WordDishesScaffoldArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => WordDishesScaffold(
          key: args.key,
          word: args.word,
        ),
        settings: data,
      );
    },
    DishesGrid: (data) {
      final args = data.getArgs<DishesGridArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => DishesGrid(
          key: args.key,
          dishes: args.dishes,
        ),
        settings: data,
      );
    },
    DishScaffold: (data) {
      final args = data.getArgs<DishScaffoldArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => DishScaffold(
          key: args.key,
          dish: args.dish,
        ),
        settings: data,
      );
    },
    PracticeWidget: (data) {
      final args = data.getArgs<PracticeWidgetArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => PracticeWidget(
          key: args.key,
          word: args.word,
        ),
        settings: data,
      );
    },
    CategoriesScaffold: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => CategoriesScaffold(),
        settings: data,
      );
    },
    SearchWordScaffold: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => SearchWordScaffold(),
        settings: data,
      );
    },
    RegionScaffold: (data) {
      final args = data.getArgs<RegionScaffoldArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => RegionScaffold(
          key: args.key,
          region: args.region,
        ),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// WordDishesScaffold arguments holder class
class WordDishesScaffoldArguments {
  final Key key;
  final Word word;
  WordDishesScaffoldArguments({this.key, @required this.word});
}

/// DishesGrid arguments holder class
class DishesGridArguments {
  final Key key;
  final List<Dish> dishes;
  DishesGridArguments({this.key, @required this.dishes});
}

/// DishScaffold arguments holder class
class DishScaffoldArguments {
  final Key key;
  final Dish dish;
  DishScaffoldArguments({this.key, @required this.dish});
}

/// PracticeWidget arguments holder class
class PracticeWidgetArguments {
  final Key key;
  final Word word;
  PracticeWidgetArguments({this.key, @required this.word});
}

/// RegionScaffold arguments holder class
class RegionScaffoldArguments {
  final Key key;
  final Region region;
  RegionScaffoldArguments({this.key, @required this.region});
}
