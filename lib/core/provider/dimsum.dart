import 'dart:collection'; // Map
import 'dart:convert'; // json

import 'package:flutter/foundation.dart' show ChangeNotifier;
import 'package:flutter/services.dart' show rootBundle;

import 'package:flutter_riverpod/flutter_riverpod.dart';

// for favorites
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:talkdimsum/core/model/dish.dart';
import 'package:talkdimsum/core/model/tags.dart';
import 'package:talkdimsum/core/model/word.dart';

// should split into providers for categories, favorites, etc.
final dimsumProvider = FutureProvider((ref) async {
  var dim = DimSum();
  await (dim._load());
  return dim;
});

class DimSum with ChangeNotifier {
  final List<Dish> _dishList = [];
  final HashMap<String, Dish> _dishMap = HashMap<String, Dish>();

  Dish addDish(Dish dish) {
    _dishList.add(dish);
    _dishMap[dish.word.id] = dish;
    return dish;
  }

  Dish dish(String name) {
    return _dishMap[name];
  }

  List<Dish> dishes(Word word) {
    return _dishList
        .where((dish) => dish.words.contains(word) || dish.hasTag(word))
        .toList();
  }

  List<Word> get dishWords {
    final words = _dishList.map((dish) => dish.words[0]).toList();
    words.addAll(_dishList
        .map((dish) => dish.tags)
        .expand((pair) => pair)
        .map((tag) => Word.words[tag])
        .where((word) => word != null));
    return words;
  }

  List<Dish> favorites = [];

  List<String> _categories = [];

  _load() async {
    await _loadDishes();
    await _loadCategories();
    await _loadFavorites();
    Tags.load();
  }

  _loadDishes() async {
    final dishfiles = await rootBundle
        .loadString('assets/json/dish/dishes.json')
        .then((str) => List<String>.from(jsonDecode(str)));
    dishfiles
        .forEach((filename) => _loadDishList('assets/json/dish/' + filename));
  }

  _loadDishList(String path) async {
    final dishes = await rootBundle.loadString(path + '.json').then((str) =>
        List<Dish>.from(jsonDecode(str).map((json) => Dish.fromJson(json))));
    dishes.forEach((dish) => dish.words.forEach((word) => Word.add(word)));
    dishes.forEach((dish) => addDish(dish));
    notifyListeners();
  }

  _loadCategories() async {
    _categories = await rootBundle
        .loadString('assets/json/dish/categories.json')
        .then((str) => List<String>.from(jsonDecode(str)));
    notifyListeners();
  }

  List<Dish> get categories {
    final tags = _categories.map((tag) => dish(tag)).toList();
    //   tags.removeWhere((item) => item == null);
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
          'CREATE TABLE favorites(name TEXT PRIMARY KEY)',
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

  void addFavorite(Dish dish) async {
    if (!isFavorite(dish)) {
      favorites.add(dish);
      final db = await database();
      await db.insert(
        table,
        {'name': dish.word.id},
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      notifyListeners();
    }
  }

  void removeFavorite(Dish dish) async {
    if (isFavorite(dish)) {
      favorites.remove(dish);
      final db = await database();
      await db.delete(
        table,
        where: 'name = ?',
        // Pass the id as a whereArg to prevent SQL injection.
        whereArgs: [dish.word.id],
      );
      notifyListeners();
    }
  }

  void _loadFavorites() async {
    final db = await database();
    final maps = await db.query(table);
    favorites = maps
        .map((map) => dish(map['name']))
        .where((dish) => dish != null)
        .toList();
    notifyListeners();
  }
}
