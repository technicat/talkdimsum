/* Technicat LLC */

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:store_redirect/store_redirect.dart';

import 'categories_grid.dart';
import 'favorites_grid.dart';
import 'search_word_scaffold.dart';

class DishesScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Talk Dim Sum'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.favorite_border),
          tooltip: 'Favorites',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoritesScaffold()),
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.search),
          tooltip: 'Search',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchWordScaffold()),
            );
          },
        ),
      ]),
      body: CategoriesGrid(),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Image.asset('assets/images/icon/catgraphic.png'),
            ),
            ListTile(
              title: Text('Technicat'),
              onTap: () {
                launch('http://technicat.com');
              },
            ),
            ListTile(
              title: Text('Google Play'),
              onTap: () {
                launch(
                    'https://play.google.com/store/apps/details?id=com.technicat.talkdimsum');
                // StoreRedirect.redirect();
              },
            ),
            /*     ListTile(
              title: Text('Icons8'),
              onTap: () {
                launch('https://icons8.com/');
              },
            ), */
          ],
        ),
      ),
    );
  }
}
