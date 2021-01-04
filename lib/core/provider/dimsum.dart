import 'dart:convert'; // json

import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter/services.dart' show rootBundle;

import 'package:talkdimsum/core/model/dish.dart';
import 'package:talkdimsum/core/model/phrases.dart';
import 'package:talkdimsum/core/model/tags.dart';
import 'package:talkdimsum/core/model/word.dart';

// split into multiple providers?
class DimSum with ChangeNotifier {
  List<Dish> dishes = [];

  List<Dish> favorites = [];

  bool isFavorite(Dish dish) {
    return favorites.contains(dish);
  }

  addFavorite(Dish dish) {
    favorites.add(dish);
    notifyListeners();
  }

  removeFavorite(Dish dish) {
    favorites.remove(dish);
    notifyListeners();
  }

  List<Phrases> phrases = [];

  _loadPhrases() async {
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

  

  List<String> _categories = [];

  _loadDishes() async {
    var dishfiles = await rootBundle
        .loadString("assets/json/dish/dishes.json")
        .then((str) => List<String>.from(jsonDecode(str)));
    var dishlists = dishfiles.map((json) => _loadDishList(json));
    for (var list in dishlists) {
      dishes.addAll(await list);
    }
    dishes.forEach((dish) => dish.words.forEach((word) => Word.add(word)));
    notifyListeners();
  }

  Future<List<Dish>> _loadDishList(String path) async {
    var dishes = await rootBundle
        .loadString('assets/json/dish/' + path + '.json')
        .then((str) => List<Dish>.from(
            jsonDecode(str).map((json) => Dish.fromJson(json))));
    dishes.forEach((dish) => dish.words.forEach((word) => Word.add(word)));
    dishes.forEach((dish) => Dish.add(dish));
    //dishlist.removeWhere((dish) => dish.ignore);
    return dishes;
  }

  _loadCategories() async {
    _categories = await rootBundle
        .loadString("assets/json/dish/categories.json")
        .then((str) => List<String>.from(jsonDecode(str)));
   notifyListeners();
  }

  List<Dish> get categories {
    var tags = _categories.map((tag) => Dish.dishes[tag]).toList();
    tags.removeWhere((item) => item ==null);
    return tags;
  }

  DimSum() {
    _loadDishes();
    _loadCategories();
    _loadPhrases();
    Tags.load();
  }
}
