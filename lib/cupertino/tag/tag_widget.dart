import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/word.dart';
import 'package:talkdimsum/ui/dishes/word_dishes_widget.dart';

class TagWidget extends StatelessWidget {

  final Word tag;

  TagWidget({Key key, @required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                  Navigator.push(
                    context,
                    Cupertino/*PageRoute(
                        builder: (context) => WordDishesWidget(word: tag)),
                  );
                },
    child: CupertinoChip(
        /* avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        child: Text(tag.Chinese),
      ), */
      label: Text(tag.display()),
    )
    );
  }
}
*/