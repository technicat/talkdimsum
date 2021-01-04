import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:talkdimsum/core/model/phrases.dart';

class Conversation with ChangeNotifier {
  List<Phrases> phrases = [];

  Conversation() {
    _load();
  }

   _load() async {
    if (phrases.isNotEmpty) {
      return;
    }
    var categories = await rootBundle
        .loadString("assets/json/phrases/phrases.json")
        .then((str) => List<String>.from(jsonDecode(str)));
    var dishlists = categories.map((json) => Phrases.loadPhraseList(json));
    for (var list in dishlists) {
      phrases.add(await list);
    }
    notifyListeners();
    // phrases.forEach((dish) => dish.words.forEach((word) => Word.add(word)));
  }

}
