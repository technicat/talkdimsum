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
                icon: Icon(CupertinoIcons.chat_bubble), label: 'Phrases'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.map), label: 'Places'),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 2:
              return ScaffoldCountryWidget();
            case 1:
              return ScaffoldPhrasesWidget();
            case 0:
              return CupertinoTabView(builder: (BuildContext context) {
                return ScaffoldDishesWidget();
              });
          }
        });
  }
}
