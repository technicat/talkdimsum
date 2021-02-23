// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import '../../core/model/word.dart';
import 'dishes/word_dishes_scaffold.dart';
import 'navigation_bar.dart';

class Routes {
  static const String navigationBar = '/';
  static const String wordDishesScaffold = '/word-dishes-scaffold';
  static const all = <String>{
    navigationBar,
    wordDishesScaffold,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.navigationBar, page: NavigationBar),
    RouteDef(Routes.wordDishesScaffold, page: WordDishesScaffold),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    NavigationBar: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => NavigationBar(),
        settings: data,
      );
    },
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
