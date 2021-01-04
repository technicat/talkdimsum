import 'dart:convert'; // json

import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter/services.dart' show rootBundle;

import 'word.dart';
import 'dish.dart';
import 'phrases.dart';

class DimSum with ChangeNotifier {
  static List<Dish> dishes = [];

  List<Dish> favorites = [];

  bool isFavorite(Dish dish) {
    return favorites.contains(dish);
  }

  void addFavorite(Dish dish) {
    favorites.add(dish);
    notifyListeners();
  }

  void removeFavorite(Dish dish) {
    favorites.remove(dish);
    notifyListeners();
  }

  List<Phrases> phrases = [];

  void loadPhrases() async {
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

  static List<String> categories = [];

  static load() async {
    await loadDishes();
    await loadCategories();
  }

  static loadDishes() async {
    var dishfiles = await rootBundle
        .loadString("assets/json/dish/dishes.json")
        .then((str) => List<String>.from(jsonDecode(str)));
    var dishlists = dishfiles.map((json) => loadDishList(json));
    for (var list in dishlists) {
      dishes.addAll(await list);
    }
    dishes.forEach((dish) => dish.words.forEach((word) => Word.add(word)));
  }

  static Future<List<Dish>> loadDishList(String path) async {
    var dishes = await rootBundle
        .loadString('assets/json/dish/' + path + '.json')
        .then((str) => List<Dish>.from(
            jsonDecode(str).map((json) => Dish.fromJson(json))));
    dishes.forEach((dish) => dish.words.forEach((word) => Word.add(word)));
    dishes.forEach((dish) => Dish.add(dish));
    //dishlist.removeWhere((dish) => dish.ignore);
    return dishes;
  }

  static loadCategories() async {
    categories = await rootBundle
        .loadString("assets/json/dish/categories.json")
        .then((str) => List<String>.from(jsonDecode(str)));
  }
}
