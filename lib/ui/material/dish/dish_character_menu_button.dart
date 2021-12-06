import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:talkdimsum/core/model/dish.dart';

class DishCharacterMenuButton extends StatelessWidget {
  final Dish dish;

  DishCharacterMenuButton({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) => PopupMenuButton<String>(
        icon: Icon(Icons.help, semanticLabel: 'Learn the characters'),
        onSelected: (String value) {
          launch(value);
        },
        itemBuilder: (BuildContext context) {
          return dish.word.resources
              .map((link) => PopupMenuItem<String>(
                  value: link.url, child: Text(link.name)))
              .toList();
        },
      );
}
