/* Technicat LLC */

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:talkdimsum/core/dimsum.dart';
import 'package:talkdimsum/core/phrases.dart';

import 'phrases_list_widget.dart';

class ScaffoldPhrasesWidget extends StatefulWidget {
  @override
  ScaffoldPhrasesState createState() => ScaffoldPhrasesState();
}

class ScaffoldPhrasesState extends State<ScaffoldPhrasesWidget> {
  Phrases phrases;

  @override
  Widget build(BuildContext context) {
    return Consumer<DimSum>(builder: (context, dimsum, child) {
      if (dimsum.phrases.isNotEmpty && phrases == null) {
        phrases = dimsum.phrases[0];
      }
      return Scaffold(
          appBar: AppBar(
              title: phrases == null ? Text('') : Text(phrases.name),
              actions: <Widget>[
                PopupMenuButton<Phrases>(
                  icon: Icon(Icons.menu),
                  onSelected: (value) {
                    setState(() {
                      phrases = value;
                    });
                  },
                  itemBuilder: (BuildContext context) => dimsum.phrases
                      .map((phrases) => PopupMenuItem<Phrases>(
                          value: phrases, child: Text(phrases.name)))
                      .toList(),
                ),
              ]),
          body: phrases == null
              ? Text('Loading phrases...')
              : PhrasesListWidget(phrases: phrases));
    });
  }
}
