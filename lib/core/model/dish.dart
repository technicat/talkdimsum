import 'package:json_annotation/json_annotation.dart';

import 'word.dart';
import 'photo.dart';
import 'link.dart';

part 'dish.g.dart';

@JsonSerializable()
class Dish {
  Word get word {
    return words[0];
  }

  @JsonKey(name: 'Description', required: true)
  final String description;
  @JsonKey(required: true)
  final List<Photo> images;
  @JsonKey(name: 'Tags', defaultValue: [])
  final List<String> tags;
  @JsonKey(required: true)
  final List<Word> words;
  @JsonKey(name: 'Resources', defaultValue: [])
  final List<Link> resources;

  Dish(this.description, this.images, this.tags, this.words, this.resources);

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);

  Map<String, dynamic> toJson() => _$DishToJson(this);

  /*Dish.fromJson(Map<String, dynamic> json)
      : description = json['Description'],
        tags = json['Tags'] == null ? [] : List<String>.from(json['Tags']),
        words = json['words'] == null
            ? []
            : List<Word>.from(json['words'].map((json) => Word.fromJson(json))),
        resources = json['Resources'] == null
            ? []
            : List<Link>.from(
                json['Resources'].map((json) => Link.fromJson(json))),
        images = List<Photo>.from(
            json['images'].map((json) => Photo.fromJson(json))); */

  bool hasTag(Word tag) {
    return tags.contains(tag.id);
  }
}
