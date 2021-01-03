/* Technicat LLC */

import 'package:flutter/material.dart';

import 'package:talkdimsum/core/dimsum.dart';
import 'package:talkdimsum/core/phrases.dart';

import 'phrases_list_widget.dart';


class ScaffoldPhrasesWidget extends StatefulWidget {

@override
  ScaffoldPhrasesState createState() => ScaffoldPhrasesState();
}

class ScaffoldPhrasesState extends State<ScaffoldPhrasesWidget> {

  Phrases phrases = DimSum.phrases[0];

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        appBar: 
          AppBar(
            title: Text(phrases.name),
             actions: <Widget>[
                PopupMenuButton<Phrases>(
                    icon: Icon(Icons.menu),
                    onSelected: (value) {
                      setState(() { phrases = value; });
                    },
                    itemBuilder: (BuildContext context) => 
                       DimSum.phrases.map((phrases) => PopupMenuItem<Phrases>(value: phrases, child: Text(phrases.name))).toList(),

                ),
          ]
              ),
        body: PhrasesListWidget(phrases: phrases),
       
    );
  }

}

