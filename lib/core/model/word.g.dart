// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) {
  return Word(
    json['Chinese'] as String,
    json['Mandarin'] as String?,
    json['Simplified'] as String?,
    json['English'] as String,
    json['Yale'] as String,
    json['Pinyin'] as String,
    (json['Resources'] as List<dynamic>?)
        ?.map((e) => Link.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WordToJson(Word instance) => <String, dynamic>{
      'Chinese': instance.cantonese,
      'Mandarin': instance.mandarin,
      'Simplified': instance.simplified,
      'English': instance.english,
      'Yale': instance.yale,
      'Pinyin': instance.pinyin,
      'Resources': instance.resources,
    };
