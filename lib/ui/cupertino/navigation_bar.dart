/* Technicat LLC */

import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'dishes/categories_scaffold.dart';
import 'dishes/search_word_scaffold.dart';
import 'place/country_scaffold.dart';
import 'phrase/phrases_scaffold.dart';
import 'favorites/favorites_scaffold.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            tooltip: 'Browse dishes',
              icon: Icon(CupertinoIcons.home,), // semanticLabel: 'Browse dishes'),
              label: AppLocalizations.of(context)!.dishes),
          BottomNavigationBarItem(
            tooltip: 'Search dishes',
              icon: Icon(CupertinoIcons.search), //semanticLabel: 'Search dishes'),
              label: AppLocalizations.of(context)!.search),
          BottomNavigationBarItem(
              tooltip: 'Browse your favorite dishes',
              icon: Icon(
                CupertinoIcons.heart,
              ),
              //  semanticLabel: 'Browse your favorite dishes'),
              label: AppLocalizations.of(context)!.favorites),
          BottomNavigationBarItem(
              tooltip: 'Learn Chinese phrases',
              icon: Icon(
                CupertinoIcons.chat_bubble,
              ),
              // semanticLabel: 'Learn Chinese phrases'),
              label: AppLocalizations.of(context)!.phrases),
          BottomNavigationBarItem(
              tooltip: 'Find dim sum restaurants',
              icon: Icon(CupertinoIcons.map),
              //  semanticLabel: 'Find dim sum restaurants'),
              label: AppLocalizations.of(context)!.places),
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
