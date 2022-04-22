/* Technicat LLC */

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:app_settings/app_settings.dart';
import 'package:get/get.dart';

//import '../ai/ai_scaffold.dart';
import 'categories_grid.dart';
import 'favorites_grid.dart';
import 'search_word_scaffold.dart';

class DishesScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Dishes'), actions: <Widget>[
          /*        IconButton(
                icon: Icon(Icons.camera_alt_outlined,
                    semanticLabel: AppLocalizations.of(context)!.ai),
                tooltip: AppLocalizations.of(context)!.favorites,
                onPressed: () => Get.to (() => AIScaffold()),
              ), */
          IconButton(
            icon: Icon(Icons.favorite_border, semanticLabel: 'Favorites'),
            tooltip: 'View saved favorites',
            onPressed: () => Get.to(() => FavoritesScaffold()),
          ),
          IconButton(
            icon: Icon(Icons.search, semanticLabel: 'Search'),
            tooltip: 'Search for dishes',
            onPressed: () => Get.to(() => SearchWordScaffold()),
          ),
        ]),
        body: CategoriesGrid(),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text('Technicat'),
                onTap: () {
                  launch('http://technicat.com');
                },
              ),
              ListTile(
                title: Text('Talk Dim Sum'),
                onTap: () {
                  launch('http://talkdimsum.com');
                },
              ),
              ListTile(
                title: Text('Settings'),
                onTap: () {
                  AppSettings.openAppSettings();
                },
              ),
            ],
          ),
        ),
      );
}
