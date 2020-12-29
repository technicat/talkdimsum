import 'package:flutter/material.dart';

import 'package:talkdimsum/core/word.dart';
import 'package:talkdimsum/ui/material/dishes/word_dishes_widget.dart';

class TagWidget extends StatelessWidget {

  final Word tag;

  TagWidget({Key key, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WordDishesWidget(word: tag)),
                  );
                },
    child: Chip(
        /* avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        child: Text(tag.Chinese),
      ), */
      label: Text(tag.display()),
    )
    );
  }
}
