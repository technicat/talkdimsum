import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:talkdimsum/core/model/dish.dart';

class DishInfoMenuButton extends StatelessWidget {
  final Dish dish;

  DishInfoMenuButton({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) => PopupMenuButton<String>(
        icon:
            Icon(Icons.info, semanticLabel: 'Share and learn about this dish'),
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
            ...dish.resources.map((link) =>
                PopupMenuItem<String>(value: link.url, child: Text(link.name)))
          ];
        },
      );
}
