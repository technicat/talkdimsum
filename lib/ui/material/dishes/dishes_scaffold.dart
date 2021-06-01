/* Technicat LLC */

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_settings/app_settings.dart';
import 'package:get/get.dart';

import 'categories_grid.dart';
import 'favorites_grid.dart';
import 'search_word_scaffold.dart';

class DishesScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('title'.tr), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border, semanticLabel: 'Favorites'),
            tooltip: 'Favorites',
            onPressed: () => Get.to(FavoritesScaffold()),
          ),
          IconButton(
            icon: Icon(Icons.search, semanticLabel: 'search'.tr),
            tooltip: 'Search',
            onPressed: () => Get.to(SearchWordScaffold()),
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
                title: Text('title'.tr),
                onTap: () {
                  launch('http://talkdimsum.com');
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
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  AppSettings.openAppSettings();
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
