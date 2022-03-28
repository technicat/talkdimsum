import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:talkdimsum/core/model/word.dart';
import 'package:talkdimsum/ui/material/dishes/word_dishes_scaffold.dart';

class TagWidget extends StatelessWidget {
  final Word tag;

  TagWidget({Key? key, required this.tag}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () => Get.to(() => WordDishesScaffold(word: tag)),
      child: Chip(
        /* avatar: CircleAvatar(
        backgroundColor: Colors.grey.shade800,
        child: Text(tag.Chinese),
      ), */
        label: Text(tag.display()),
      ));
}
