/* Technicat LLC */

import 'package:flutter/cupertino.dart';

import 'dishes/categories_scaffold.dart';
import 'place/scaffold_country_widget.dart';
import 'phrase/scaffold_phrases_widget.dart';
import 'favorites/favorites_scaffold.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: 'Dishes'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart), label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble), label: 'Phrases'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.map), label: 'Places'),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder: (BuildContext context) {
                return CategoriesScaffold();
              });
            case 2:
              return CupertinoTabView(builder: (BuildContext context) {
                return FavoritesScaffold();
              });
            case 3:
              return CupertinoTabView(builder: (BuildContext context) {
                return ScaffoldPhrasesWidget();
              });
            case 4:
              return CupertinoTabView(builder: (BuildContext context) {
                return ScaffoldCountryWidget();
              });
            default:
              return Center(child: Text('nothing to see here'));
          }
        });
  }
}
