import 'dart:convert'; // json

import 'package:flutter/services.dart' show rootBundle;

import 'word.dart';
import 'dish.dart';

class DimSum {

  static List<Dish> dishes = [];

  static List<Dish> favorites = [];

  static List<String> categories = [];

   static load() async {
    await loadDishes();
    await loadCategories();
   }

   static loadDishes() async {
      var dishfiles = await rootBundle.loadString("assets/json/dish/dishes.json").then((str) =>
        List<String>.from(jsonDecode(str)));
      var dishlists = dishfiles.map((json) => loadDishList(json));
      for (var list in dishlists) {
        dishes.addAll(await list);
      }
      dishes.forEach((dish) => dish.words.forEach((word) => Word.add(word)));
  }

  static Future<List<Dish>> loadDishList(String path) async {
    var dishes = await rootBundle.loadString('assets/json/dish/'+path+'.json').then((str) =>
        List<Dish>.from(jsonDecode(str).map((json) => Dish.fromJson(json))));
    dishes.forEach((dish) => dish.words.forEach((word) => Word.add(word)));
    dishes.forEach((dish) => Dish.add(dish));
    //dishlist.removeWhere((dish) => dish.ignore);
    return dishes;
  }

  static loadCategories() async {
      categories = await rootBundle.loadString("assets/json/dish/categories.json").then((str) =>
        List<String>.from(jsonDecode(str)));
  }
}

