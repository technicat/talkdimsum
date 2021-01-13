/* Technicat LLC */

import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

import 'package:talkdimsum/core/provider/conversation.dart';

import 'phrases_list_widget.dart';

class PhrasesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Conversation>(
        builder: (context, conversation, child) => conversation.phrases.isEmpty
            ? CupertinoActivityIndicator()
            : PhrasesListWidget(phrases: conversation.phrases[0]));
  }
}
