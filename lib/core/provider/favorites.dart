// https://flutter.dev/docs/cookbook/persistence/sqlite

import 'dart:async';

import 'package:flutter/foundation.dart' show ChangeNotifier;

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:talkdimsum/core/model/dish.dart';

class Favorites with ChangeNotifier {
  static const table = 'favorites';

  List<Dish> dishes = [];

  Favorites() {
    _load();
  }

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

  bool has(Dish dish) {
    return dishes.contains(dish);
  }

  add(Dish dish) async {
    dishes.add(dish);
    final Database db = await database();
    await db.insert(
      table,
      {'name': dish.word.id},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  remove(Dish dish) async {
    dishes.remove(dish);
    final db = await database();
    await db.delete(
      table,
      where: 'name = ?}',
      // Pass the id as a whereArg to prevent SQL injection.
      whereArgs: [dish.word.id],
    );
  }

  _load() async {
    final Database db = await database();
    final List<Map<String, dynamic>> maps = await db.query(table);
    //dishes = maps.map((map) => DimSum.dishes[map['name']]).where((dish) => dish != null).toList();
  }

  
}
