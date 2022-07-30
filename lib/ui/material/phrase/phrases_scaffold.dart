/* Technicat LLC */

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/provider/conversation.dart';
import 'package:talkdimsum/core/model/phrases.dart';

import 'phrases_list_view.dart';

import '../progress.dart';

class PhrasesScaffold extends StatefulWidget {
  @override
  ScaffoldPhrasesState createState() => ScaffoldPhrasesState();
}

class ScaffoldPhrasesState extends State<PhrasesScaffold> {
  Phrases? phrases;

  @override
  Widget build(BuildContext context) =>
      Consumer(builder: (context, ref, child) {
        var conversation = ref.watch(phrasesProvider);
        return conversation.map(
            data: (_) {
              if (_.value.phrases.isNotEmpty && phrases == null) {
                phrases = _.value.phrases[0];
              }
              return Scaffold(
                  appBar: AppBar(
                      title: phrases == null ? Text('') : Text(phrases!.name),
                      actions: [
                        PopupMenuButton<Phrases>(
                          icon:
                              Icon(Icons.menu, semanticLabel: 'Choose phrases'),
                          onSelected: (value) {
                            setState(() {
                              phrases = value;
                            });
                          },
                          itemBuilder: (BuildContext context) => _.value.phrases
                              .map((phrases) => PopupMenuItem<Phrases>(
                                  value: phrases, child: Text(phrases.name)))
                              .toList(),
                        ),
                      ]),
                  body: phrases == null
                      ? Progressor()
                      : PhrasesListView(phrases: phrases!));
            },
            loading: (_) => Scaffold(
                appBar: AppBar(title: Text('Phrases')), body: Progressor()),
            error: (_) => Scaffold(
                appBar: AppBar(title: Text('Phrases')),
                body: Text(_.error.toString(),
                    style: TextStyle(color: Colors.red))));
      });
}
