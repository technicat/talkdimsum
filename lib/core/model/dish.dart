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

  @JsonKey(required: true)
  final String description;
  @JsonKey(required: true)
  final List<Photo> images;
  @JsonKey(defaultValue: [])
  final List<String> tags;
  @JsonKey(required: true)
  final List<Word> words;
  @JsonKey(required: true)
  final List<Link> resources;

  Dish(this.description, this.images, this.tags, this.words, this.resources);

  factory Dish.fromJson(Map<String, dynamic> json) => _$DishFromJson(json);

  bool hasTag(Word tag) => tags.contains(tag.id);
}
