import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/model/phrases.dart';

final phrasesProvider = FutureProvider((ref) async {
  var con = Conversation();
  await con.load();
  return con;
});

class Conversation with ChangeNotifier {
  List<Phrases> phrases = [];

  load() async {
    // print("loading phrases...");
    //  if (phrases.isEmpty) {
    var categories = await rootBundle
        .loadString('assets/json/phrases/phrases.json')
        .then((str) => List<String>.from(jsonDecode(str)));
    for (var filename in categories) {
      var list = Phrases.loadPhraseList('assets/json/phrases/' + filename);
      phrases.add(await list);
    }
/*
    var dishlists = categories.map((filename) =>
        Phrases.loadPhraseList('assets/json/phrases/' + filename));
    for (var list in dishlists) {
      phrases.add(await list);
      // notifyListeners();
    } */
    // phrases.forEach((dish) => dish.words.forEach((word) => Word.add(word)));
    //  }
  }
}
