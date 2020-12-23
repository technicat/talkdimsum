import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/dish.dart';
import 'package:talkdimsum/core/word.dart';

import '../tag/tag_widget.dart';

class RowTagsWidget extends StatelessWidget {

  final Dish dish;

  RowTagsWidget({Key key, @required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
      SingleChildScrollView(scrollDirection: Axis.horizontal, 
      	child: Row(children: dish.tags.map((tag) => Word.words[tag]).where((word) => word != null).map((word) => TagWidget(tag: word)).toList()));
    }
}

