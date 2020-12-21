/* Technicat LLC */

import 'package:flutter/material.dart';

import 'package:talkdimsum/core/phrases.dart';

import 'phrases_list_widget.dart';


class ScaffoldPhrasesWidget extends StatefulWidget {
  
  Phrases phrases = Phrases.phrases[0];

@override
  ScaffoldPhrasesState createState() => ScaffoldPhrasesState();
}

class ScaffoldPhrasesState extends State<ScaffoldPhrasesWidget> {

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        appBar: 
          AppBar(
            title: Text(widget.phrases.name),
             actions: <Widget>[
                PopupMenuButton<Phrases>(
                    icon: Icon(Icons.menu),
                    onSelected: (value) {
                      setState(() { widget.phrases = value; });
                    },
                    itemBuilder: (BuildContext context) => 
                       Phrases.phrases.map((phrases) => PopupMenuItem<Phrases>(value: phrases, child: Text(phrases.name))).toList(),

                ),
          ]
              ),
        body: PhrasesListWidget(phrases: widget.phrases),
       
    );
  }

}

