import 'dart:convert'; // json

import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter/services.dart' show rootBundle;

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:talkdimsum/core/model/dish.dart';
import 'package:talkdimsum/core/model/tags.dart';
import 'package:talkdimsum/core/model/word.dart';

// split into multiple providers?
class DimSum with ChangeNotifier {
  List<Dish> dishes = [];

  List<Dish> favorites = [];

  List<String> _categories = [];

  DimSum() {
    _loadDishes();
    _loadCategories();
    _loadFavorites();
    Tags.load();
  }

 

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

   static const table = 'favorites';

  static Future<Database> database() async {
    return openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'favorites.db'),

      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          "CREATE TABLE favorites(name TEXT PRIMARY KEY)",
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
  }

   bool isFavorite(Dish dish) {
    return favorites.contains(dish);
  }

  addFavorite(Dish dish) async {
    favorites.add(dish);
    final Database db = await database();
    db.insert(
      table,
      {'name': dish.word.id},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
     notifyListeners();
  }

  removeFavorite(Dish dish) async {
    favorites.remove(dish);
    final db = await database();
    db.delete(
      table,
      where: 'name = ?}',
      // Pass the id as a whereArg to prevent SQL injection.
      whereArgs: [dish.word.id],
    );
    notifyListeners();
  }

  _loadFavorites() async {
    final Database db = await database();
    final List<Map<String, dynamic>> maps = await db.query(table);
    //dishes = maps.map((map) => DimSum.dishes[map['name']]).where((dish) => dish != null).toList();
  }
}
