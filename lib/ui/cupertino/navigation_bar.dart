/* Technicat LLC */

import 'package:flutter/cupertino.dart';

import 'dishes/categories_scaffold.dart';
import 'dishes/search_word_scaffold.dart';
import 'place/country_scaffold.dart';
import 'phrase/phrases_scaffold.dart';
import 'favorites/favorites_scaffold.dart';

class MyNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              tooltip: 'Browse dishes',
              icon: Icon(
                CupertinoIcons.home,
              ), // semanticLabel: 'Browse dishes'),
              label: 'Dishes'),
          BottomNavigationBarItem(
              tooltip: 'Search dishes',
              icon: Icon(
                  CupertinoIcons.search), //semanticLabel: 'Search dishes'),
              label: 'Search'),
          BottomNavigationBarItem(
              tooltip: 'Browse your favorite dishes',
              icon: Icon(
                CupertinoIcons.heart,
              ),
              //  semanticLabel: 'Browse your favorite dishes'),
              label: 'Favorites'),
          BottomNavigationBarItem(
              tooltip: 'Learn Chinese phrases',
              icon: Icon(
                CupertinoIcons.chat_bubble,
              ),
              // semanticLabel: 'Learn Chinese phrases'),
              label: 'Phrases'),
          BottomNavigationBarItem(
              tooltip: 'Find dim sum restaurants',
              icon: Icon(CupertinoIcons.map),
              //  semanticLabel: 'Find dim sum restaurants'),
              label: 'Places'),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (BuildContext context) {
              return CategoriesScaffold();
            });
          case 1:
            return CupertinoTabView(builder: (BuildContext context) {
              return SearchWordScaffold();
            });
          case 2:
            return CupertinoTabView(builder: (BuildContext context) {
              return FavoritesScaffold();
            });
          case 3:
            return CupertinoTabView(builder: (BuildContext context) {
              return PhrasesScaffold();
            });
          case 4:
            return CupertinoTabView(builder: (BuildContext context) {
              return CountryScaffold();
            });
          default:
            return Center(child: Text('nothing to see here'));
        }
      });
}
