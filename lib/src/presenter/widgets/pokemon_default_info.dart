import 'package:flutter/material.dart';
import 'package:pokedex/src/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/domain/resources/extensions/string_extension.dart';

class PokemonDefaultInfo extends StatelessWidget {
  final PokemonEntity pokemon;
  const PokemonDefaultInfo({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: pokemon.mainColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(24),
              ),
              border: Border.all(width: 4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  pokemon.name.captalize(),
                  style: TextStyle(
                    fontFamily: 'PokemonPixelFont',
                    fontSize: 60,
                    color: pokemon.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Table(
            children: [
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: pokemon.mainColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Height',
                            style: TextStyle(
                              fontFamily: 'PokemonPixelFont',
                              fontSize: 60,
                              color: pokemon.secondaryColor,
                            ),
                          ),
                          Text(
                            '${pokemon.height.toStringAsFixed(1)} m',
                            style: const TextStyle(
                              fontFamily: 'PokemonPixelFont',
                              fontSize: 60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: pokemon.mainColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Weight',
                            style: TextStyle(
                              fontFamily: 'PokemonPixelFont',
                              fontSize: 60,
                              color: pokemon.secondaryColor,
                            ),
                          ),
                          Text(
                            '${pokemon.weight.toStringAsFixed(1)} kg',
                            style: const TextStyle(
                              fontFamily: 'PokemonPixelFont',
                              fontSize: 60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: pokemon.mainColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Type 1',
                            style: TextStyle(
                              fontFamily: 'PokemonPixelFont',
                              fontSize: 60,
                              color: pokemon.secondaryColor,
                            ),
                          ),
                          Text(
                            pokemon.types[0],
                            style: const TextStyle(
                              fontFamily: 'PokemonPixelFont',
                              fontSize: 60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: pokemon.mainColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(24),
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Type 2',
                            style: TextStyle(
                              fontFamily: 'PokemonPixelFont',
                              fontSize: 60,
                              color: pokemon.secondaryColor,
                            ),
                          ),
                          Text(
                            (pokemon.types.length > 1)
                                ? pokemon.types[1]
                                : "None",
                            style: const TextStyle(
                              fontFamily: 'PokemonPixelFont',
                              fontSize: 60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
