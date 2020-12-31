/* Technicat LLC */

import 'package:flutter/cupertino.dart';

import 'dishes/scaffold_dishes_widget.dart';
import 'place/scaffold_country_widget.dart';
import 'phrase/scaffold_phrases_widget.dart';

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
            case 5:
              return CupertinoTabView(builder: (BuildContext context) {
                return ScaffoldCountryWidget();
              });
            case 4:
              return CupertinoTabView(builder: (BuildContext context) {
                return ScaffoldPhrasesWidget();
              });
            case 0:
              return CupertinoTabView(builder: (BuildContext context) {
                return ScaffoldDishesWidget();
              });
            default:
              return Text('nothing to see here');
          }
        });
  }
}
