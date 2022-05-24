import 'dart:collection'; // Map
import 'dart:convert'; // json
import 'dart:io';
import 'package:get/get.dart';

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
  await (dim.load());
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

  Dish? dish(String name) {
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
        .where((word) => word != null)
        .map((word) => word!));
    return words;
  }

  var favorites = <Dish>[].obs;

  List<String> _categories = [];

  load() async {
    await loadDishes();
    await loadCategories();
    await loadFavorites();
    Tags.load();
  }

  loadDishes() async {
    final dishfiles = await rootBundle
        .loadString('assets/json/dish/dishes.json')
        .then((str) => List<String>.from(jsonDecode(str)));
    for (var filename in dishfiles) {
      _loadDishList('assets/json/dish/' + filename);
    }
  }

  _loadDishList(String path) async {
    try {
      final dishes = await rootBundle.loadString(path + '.json').then((str) =>
          List<Dish>.from(jsonDecode(str).map((json) => Dish.fromJson(json))));
      for (var dish in dishes) {
        for (var word in dish.words) {
          // although we only really use the first word
          Word.add(word);
        }
        addDish(dish);
      }
      //  for (var dish in dishes) {
      //    addDish(dish);
      //  }
      notifyListeners();
    } catch (e) {
      print("Error reading json " + path);
      print(e);
    }
  }

  loadCategories() async {
    _categories = await rootBundle
        .loadString('assets/json/dish/categories.json')
        .then((str) => List<String>.from(jsonDecode(str)));
    notifyListeners();
  }

  List<Dish> get categories {
    final tags =
        _categories.map((tag) => dish(tag)).where((item) => item != null);
    return tags.map((dish) => dish!).toList();
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

  /* bool isFavorite(Dish dish) {
    return favorites.contains(dish);
  } */

  addFavorite(Dish dish) async {
    if (!favorites.contains(dish)) {
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

  removeFavorite(Dish dish) async {
    if (favorites.contains(dish)) {
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

  loadFavorites() async {
    final db = await database();
    final maps = await db.query(table);
    favorites = RxList(maps
        .map((map) => dish(map['name'] as String))
        .where((dish) => dish != null)
        .map((dish) => dish!)
        .toList());
    notifyListeners();
  }
}
