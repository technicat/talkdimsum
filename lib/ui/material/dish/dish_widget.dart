import 'package:flutter/material.dart';

import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:talkdimsum/core/dish.dart';
import 'package:talkdimsum/core/dimsum.dart';

import 'dish_summary_widget.dart';

// https://flutterrdart.com/flutter-popup-menu-button-example/

class DishWidget extends StatelessWidget {
  final Dish dish;

  DishWidget({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: DimSum.isFavorite(dish)
            ? FloatingActionButton(
                onPressed: () {
                  // setState(() { Favorites.remove(widget.dish); });
                },
                child: Icon(Icons.favorite))
            : FloatingActionButton(
                onPressed: () {
                  // setState(() { Favorites.add(widget.dish); });
                },
                child: Icon(Icons.favorite_border)),
        appBar: AppBar(
            //   title: Text('${dish.word.English}'),
            actions: <Widget>[
              PopupMenuButton<String>(
                icon: Icon(Icons.help),
                onSelected: (String value) {
                  switch (value) {
                    case "share":
                      {
                        Share.share(
                            "I had ${dish.word.chineseText()} #dimsum #yumcha #talkdimsum talkdimsum.com",
                            subject: "Talk Dim Sum");
                      }
                      break;
                    default:
                      {
                        launch(value);
                      }
                  }
                },
                itemBuilder: (BuildContext context) {
                  List<PopupMenuEntry<String>> menu = List();
                  menu.addAll(dish.word.resources.map((link) =>
                      PopupMenuItem<String>(
                          value: link.url, child: Text(link.name))));
                  return menu;
                },
              ),
              PopupMenuButton<String>(
                icon: Icon(Icons.info),
                onSelected: (String value) {
                  switch (value) {
                    case "share":
                      {
                        Share.share(
                            "I had ${dish.word.chineseText()} #dimsum #yumcha #talkdimsum talkdimsum.com",
                            subject: "Talk Dim Sum");
                      }
                      break;
                    default:
                      {
                        launch(value);
                      }
                  }
                },
                itemBuilder: (BuildContext context) {
                  List<PopupMenuEntry<String>> menu = [];
                  menu.add(PopupMenuItem<String>(
                    value: "share",
                    child: Text('share'),
                  ));
                  /* menu.addAll(widget.dish.word.resources.map((link) => PopupMenuItem<String>(value: link.URL, child: Text(link.name)))); */
                  menu.addAll(dish.resources.map((link) =>
                      PopupMenuItem<String>(
                          value: link.url, child: Text(link.name))));
                  return menu;
                },
              )
            ]),
        body: DishSummaryWidget(dish: dish));
  }
}
