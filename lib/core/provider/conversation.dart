import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:talkdimsum/core/model/phrases.dart';

final conversation = FutureProvider((ref) async {
  var con = Conversation();
  return con.load();
});

class Conversation with ChangeNotifier {
  List<Phrases> phrases = [];

 /* Conversation() async {
    return _load();
  } */

   Future<List<Phrases>> load() async {
    if (phrases.isNotEmpty) {
      return phrases;
    }
    var categories = await rootBundle
        .loadString('assets/json/phrases/phrases.json')
        .then((str) => List<String>.from(jsonDecode(str)));
    var dishlists = categories.map((filename) => Phrases.loadPhraseList('assets/json/phrases/' + filename));
    for (var list in dishlists) {
      phrases.add(await list);
      notifyListeners();
    }
    return phrases;
    // phrases.forEach((dish) => dish.words.forEach((word) => Word.add(word)));
  }
}
