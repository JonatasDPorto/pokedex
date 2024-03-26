// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class PokemonEntity extends Equatable {
  final int id;
  final String name;
  final int baseExperience;
  final double height;
  final bool isDefault;
  final int order;
  final double weight;
  final Color mainColor;
  final Color secondaryColor;
  final List<String> types;
  final List<String> abilities;
  final List<String> moves;
  final List<String?> images;

  const PokemonEntity({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.mainColor,
    required this.secondaryColor,
    required this.types,
    required this.abilities,
    required this.moves,
    required this.images,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      baseExperience,
      height,
      isDefault,
      order,
      weight,
      mainColor,
      secondaryColor,
      types,
      abilities,
      moves,
      images,
    ];
  }
}
