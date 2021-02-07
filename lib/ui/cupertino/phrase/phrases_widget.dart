/* Technicat LLC */

//import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/provider/conversation.dart';

import 'phrases_list_view.dart';

class PhrasesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      var phrases = watch(conversation);
      return phrases.map(
          data: (_) {
            return _.value.isEmpty
                ? CupertinoActivityIndicator()
                : PhrasesListView(phrases: _.value[0]);
          },
          loading: (_) => CupertinoActivityIndicator(),
          error: (_) => Text(
                _.error.toString(),
                style: TextStyle(color: CupertinoColors.destructiveRed),
              ));
    });
  }
}
