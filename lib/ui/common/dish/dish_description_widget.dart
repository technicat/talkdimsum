import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:talkdimsum/core/model/dish.dart';

class DishDescriptionWidget extends StatelessWidget {
  final Dish dish;

  DishDescriptionWidget({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) => Markdown(
      data: dish.description,
      onTapLink: (text, url, title) {
        if (url != null) {
          launch(url);
        }
      });
}
