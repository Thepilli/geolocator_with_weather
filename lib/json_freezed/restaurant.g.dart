// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Restaurant _$$_RestaurantFromJson(Map<String, dynamic> json) =>
    _$_Restaurant(
      name: json['name'] as String,
      cuisine: json['cuisine'] as String,
      yearOpened: json['year_opened'] as int?,
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((e) => Review.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_RestaurantToJson(_$_Restaurant instance) =>
    <String, dynamic>{
      'name': instance.name,
      'cuisine': instance.cuisine,
      'year_opened': instance.yearOpened,
      'reviews': instance.reviews,
    };
