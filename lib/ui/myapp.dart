/*
 Technicat LLC 
 Entry point for Talk Dim Sum
*/

import 'package:flutter/material.dart';

import 'navigationbar.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talk Dim Sum',
      theme: ThemeData.light(), /* (
        primarySwatch: Colors.blue,
      ), */
      home: NavigationBar(),
      /* MultiProvider(
      		providers: [
      			ChangeNotifierProvider<DimSum>(builder: (_) => DimSum()),
      			ChangeNotifierProvider<Restaurants>(builder: (_) => Restaurants()),
      			ChangeNotifierProvider<Favorites>(builder: (_) => Favorites()),
      		],
        	child: MyHomePage(),
      ), */
    );
  }
/*
  _read() async {
        final prefs = await SharedPreferences.getInstance();
        final key = 'my_int_key';
        final value = prefs.getInt(key) ?? 0;
        print('read: $value');
      }

      _save() async {
        final prefs = await SharedPreferences.getInstance();
        final key = 'my_int_key';
        final value = 42;
        prefs.setInt(key, value);
        print('saved $value');
      } */
}