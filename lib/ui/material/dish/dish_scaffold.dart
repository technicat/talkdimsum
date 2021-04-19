import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:talkdimsum/core/model/dish.dart';
import 'package:talkdimsum/core/provider/dimsum.dart';
import 'package:talkdimsum/ui/common/error_text.dart';

import '../progress.dart';
import 'dish_widget.dart';

// https://flutterrdart.com/flutter-popup-menu-button-example/

class DishScaffold extends StatelessWidget {
  final Dish dish;

  DishScaffold({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      var dimsum = watch(dimsumProvider);
      return dimsum.map(
          data: (_) => Scaffold(
              floatingActionButton: _.value.isFavorite(dish)
                  ? FloatingActionButton(
                      onPressed: () {
                        _.value.removeFavorite(dish);
                         Fluttertoast.showToast(
                            msg: "Removed from favorites",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                      child: Icon(Icons.favorite))
                  : FloatingActionButton(
                      onPressed: () {
                        _.value.addFavorite(dish);
                        Fluttertoast.showToast(
                            msg: "Added to favorites",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      },
                      child: Icon(Icons.favorite_border)),
              appBar: AppBar(
                  //   title: Text('${dish.word.English}'),
                  actions: <Widget>[
                    PopupMenuButton<String>(
                      icon: Icon(Icons.help),
                      onSelected: (String value) {
                        launch(value);
                      },
                      itemBuilder: (BuildContext context) {
                        return dish.word.resources
                            .map((link) => PopupMenuItem<String>(
                                value: link.url, child: Text(link.name)))
                            .toList();
                      },
                    ),
                    PopupMenuButton<String>(
                      icon: Icon(Icons.info),
                      onSelected: (String value) {
                        switch (value) {
                          case 'share':
                            {
                              Share.share(
                                  'I had ${dish.word.chineseText()} #dimsum #yumcha #talkdimsum talkdimsum.com',
                                  subject: 'Talk Dim Sum');
                            }
                            break;
                          default:
                            {
                              launch(value);
                            }
                        }
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem<String>(
                            value: 'share',
                            child: Text('share'),
                          ),
                          ...dish.resources.map((link) => PopupMenuItem<String>(
                              value: link.url, child: Text(link.name)))
                        ];
                      },
                    )
                  ]),
              body: DishWidget(dish: dish)),
          loading: (_) => Progress(),
          error: (_) => ErrorText(error: _.error));
    });
  }
}
