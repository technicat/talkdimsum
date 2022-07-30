/* Technicat LLC */

import 'package:flutter/cupertino.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/provider/conversation.dart';
import 'package:talkdimsum/ui/common/error_text.dart';

import 'phrases_list_view.dart';

class PhrasesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return ref.watch(phrasesProvider).map(
          data: (_) => _.value.phrases.isEmpty
              ? Text('No phrases')
              : PhrasesListView(phrases: _.value.phrases[0]),
          loading: (_) => LoadingText(),
          error: (_) => ErrorText(error: _.error));
    });
  }
}
