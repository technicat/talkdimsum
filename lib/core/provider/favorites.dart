/* import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:flutter_riverpod/flutter_riverpod.dart';

// for favorites
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:talkdimsum/core/model/dish.dart';
import 'dimsum.dart';

class Favorites extends StateNotifier<List<Dish>> {
  Favorites([List<Dish>? initialTodos]) : super(initialTodos ?? []);

  static const table = 'favorites';

  List<Dish> favorites = [];

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
/*
  _loadFavorites() async {
    var dimsum = watch(dimsumProvider);
    final db = await database();
    final maps = await db.query(table);
    favorites = maps
        .map((map) => dimsum.dish(
        .where((dish) => dish != null)
        .toList();
    notifyListeners();
  }ß */
}
*/