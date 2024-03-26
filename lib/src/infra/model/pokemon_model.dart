// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pokedex/src/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  const PokemonModel({
    required super.id,
    required super.name,
    required super.baseExperience,
    required super.height,
    required super.isDefault,
    required super.order,
    required super.weight,
    required super.mainColor,
    required super.secondaryColor,
    required super.types,
    required super.abilities,
    required super.moves,
    required super.images,
  });

  PokemonModel copyWith({
    int? id,
    String? name,
    int? baseExperience,
    double? height,
    bool? isDefault,
    int? order,
    double? weight,
    Color? mainColor,
    Color? secondaryColor,
    List<String>? types,
    List<String>? abilities,
    List<String>? moves,
    List<String>? images,
  }) {
    return PokemonModel(
      id: id ?? this.id,
      name: name ?? this.name,
      baseExperience: baseExperience ?? this.baseExperience,
      height: height ?? this.height,
      isDefault: isDefault ?? this.isDefault,
      order: order ?? this.order,
      weight: weight ?? this.weight,
      mainColor: mainColor ?? this.mainColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      types: types ?? this.types,
      abilities: abilities ?? this.abilities,
      moves: moves ?? this.moves,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'baseExperience': baseExperience,
      'height': height,
      'isDefault': isDefault,
      'order': order,
      'weight': weight,
      'mainColor': mainColor,
      'secondaryColor': secondaryColor,
      'types': types,
      'abilities': abilities,
      'moves': moves,
      'images': images,
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
      id: map['id'] as int,
      name: map['name'] as String,
      baseExperience: map['baseExperience'] as int,
      height: map['height'] as double,
      isDefault: map['isDefault'] as bool,
      order: map['order'] as int,
      weight: map['weight'] as double,
      mainColor: map['mainColor'] as Color,
      secondaryColor: map['secondaryColor'] as Color,
      types: map['types'] as List<String>,
      abilities: map['abilities'] as List<String>,
      moves: map['moves'] as List<String>,
      images: map['images'] as List<String>,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonModel.fromJson(String source) =>
      PokemonModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PokemonModel(id: $id, name: $name, baseExperience: $baseExperience, height: $height, isDefault: $isDefault, order: $order, weight: $weight, mainColor: $mainColor, secondaryColor: $secondaryColor, abilities: $abilities, moves: $moves, images: $images)';
  }
}
