/* Technicat LLC */

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'dishes/dishes_scaffold.dart';
import 'place/country_scaffold.dart';
import 'phrase/phrases_scaffold.dart';

class NavigationBar extends StatefulWidget {
  @override
  NavigationBarState createState() => NavigationBarState();
}

class NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;

  // tab selection
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _widgetOptions = [
    DishesScaffold(),
    PhrasesScaffold(),
    CountryScaffold(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, semanticLabel: 'Browse dishes'),
                label: AppLocalizations.of(context)!.dishes),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline,
                    semanticLabel: 'Learn Chinese phrases'),
                label: AppLocalizations.of(context)!.phrases),
            BottomNavigationBarItem(
                icon: Icon(Icons.restaurant_menu,
                    semanticLabel: 'Find dim sum restaurants'),
                label: AppLocalizations.of(context)!.places),
          ],
          currentIndex: _selectedIndex,
          //  fixedColor: Colors.deepPurple,
          onTap: _onItemTapped,
        ),
      );
}
