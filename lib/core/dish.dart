import 'dart:collection';

import 'word.dart';
import 'photo.dart';
import 'link.dart';

class Dish {

static HashMap<String, Dish> dishes = HashMap<String, Dish>();

  static Dish add(Dish dish) {
    Dish.dishes[dish.word.id] = dish;
    return dish;
  }

  Word get word {
    return words[0];
  }

  final String description;
  final List<Photo> images;
  final List<String> tags;
  final List<Word> words;
  final List<Link> resources;

  Dish(this.description, this.images, this.tags, this.words, this.resources);

  Dish.fromJson(Map<String, dynamic> json) :
        description = json['Description'],
        tags = json['Tags'] == null
            ? []
            : List<String>.from(json['Tags']),
        words = json['words'] == null
            ? []
            : List<Word>.from(
            json['words'].map((json) => Word.fromJson(json))),
        resources = json['Resources'] == null
            ? []
            : List<Link>.from(
            json['Resources'].map((json) => Link.fromJson(json))),
        images = List<Photo>.from(
            json['images'].map((json) => Photo.fromJson(json)));

  bool hasTag(Word tag) {
    return tags.contains(tag.id);
    }

    
}

