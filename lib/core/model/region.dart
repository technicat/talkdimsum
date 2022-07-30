import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'place.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'region.g.dart';
part 'region.freezed.dart';

@freezed
class Region with _$Region {
  Region._();

  factory Region(@required String name, @required List<Place> places) = _Region;

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  static Future<List<Region>> loadPaths(
      String path, List<String> filenames) async {
    //return filenames.map((filename) => _load(path+filename)).toList();
    List<Region> list = [];
    for (var filename in filenames) {
      list.add(await _load(path + filename));
    }
    return list;
  }

  static Future<Region> _load(String path) async {
    return rootBundle
        .loadString(path + '.json')
        .then((str) => Region.fromJson(jsonDecode(str)));
  }
}
