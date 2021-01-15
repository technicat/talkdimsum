/* Technicat LLC */

import 'package:flutter/material.dart';

import 'dishes/scaffold_dishes_widget.dart';
import 'place/scaffold_country_widget.dart';
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
    ScaffoldDishesWidget(),
    PhrasesScaffold(),
    ScaffoldCountryWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dishes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline), label: 'Phrases'),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu), label: 'Places'),
        ],
        currentIndex: _selectedIndex,
        //  fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }
}
