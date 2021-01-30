/* Technicat LLC */

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:talkdimsum/core/provider/conversation.dart';
import 'package:talkdimsum/core/model/phrases.dart';

import 'phrases_list_view.dart';

class PhrasesScaffold extends StatefulWidget {
  @override
  ScaffoldPhrasesState createState() => ScaffoldPhrasesState();
}

class ScaffoldPhrasesState extends State<PhrasesScaffold> {
  Phrases phrases;

  @override
  Widget build(BuildContext context) {
    return Consumer<Conversation>(builder: (context, conversation, child) {
      if (conversation.phrases.isNotEmpty && phrases == null) {
        phrases = conversation.phrases[0];
      }
      return Scaffold(
          appBar: AppBar(
              title: phrases == null ? Text('') : Text(phrases.name),
              actions: [
                PopupMenuButton<Phrases>(
                  icon: Icon(Icons.menu),
                  onSelected: (value) {
                    setState(() {
                      phrases = value;
                    });
                  },
                  itemBuilder: (BuildContext context) => conversation.phrases
                      .map((phrases) => PopupMenuItem<Phrases>(
                          value: phrases, child: Text(phrases.name)))
                      .toList(),
                ),
              ]),
          body: phrases == null
              ? Center(child: CircularProgressIndicator())
              : PhrasesListView(phrases: phrases));
    });
  }
}
