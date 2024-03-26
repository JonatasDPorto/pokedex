import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/domain/resources/extensions/string_extension.dart';
import 'package:pokedex/src/presenter/widgets/pokemon_default_info.dart';
import 'package:pokedex/src/presenter/widgets/pokemon_info_list.dart';
import 'package:pulsator/pulsator.dart';

class PokemonPage extends StatelessWidget {
  final PokemonEntity pokemon;
  const PokemonPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: pokemon.mainColor,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Modular.to.pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 64,
                      height: 64,
                      child: Image(
                        image: AssetImage('assets/images/pokemon-go.png'),
                      ),
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                const SizedBox(width: 16),
                const Text(
                  'Pokedex',
                  style: TextStyle(
                      fontFamily: 'PokemonPixelFont',
                      fontSize: 60,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: width,
                        height: width,
                        decoration: BoxDecoration(
                          color: pokemon.mainColor,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(width),
                            bottomLeft: Radius.circular(width),
                          ),
                        ),
                        child: Pulsator(
                          style: const PulseStyle(color: Colors.white),
                          count: 5,
                          duration: const Duration(seconds: 5),
                          repeat: 0,
                          startFromScratch: false,
                          autoStart: true,
                          fit: PulseFit.contain,
                          child: (pokemon.images.first != null)
                              ? Padding(
                                  padding: const EdgeInsets.all(64.0),
                                  child: Hero(
                                    tag: pokemon.id,
                                    child: CachedNetworkImage(
                                      imageUrl: pokemon.images.first!,
                                      width: width,
                                      height: width,
                                      filterQuality: FilterQuality.none,
                                      fit: BoxFit.contain,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              const Pulsator(
                                        style: PulseStyle(color: Colors.white),
                                        count: 3,
                                        duration: Duration(seconds: 3),
                                        repeat: 0,
                                        startFromScratch: false,
                                        autoStart: true,
                                        fit: PulseFit.contain,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Image(
                                        image: AssetImage(
                                            'assets/images/not_found.png'),
                                        filterQuality: FilterQuality.none,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  color: pokemon.secondaryColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24)),
                                ),
                                child: Text(
                                  pokemon.id.toString().pokeID(),
                                  style: TextStyle(
                                    fontFamily: 'PokemonPixelFont',
                                    fontSize: 60,
                                    color: pokemon.mainColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  PokemonDefaultInfo(pokemon: pokemon),
                  const SizedBox(height: 16),
                  PokemonInfoList(
                    title: "Abilities",
                    mainColor: pokemon.mainColor,
                    secondaryColor: pokemon.secondaryColor,
                    data: pokemon.abilities,
                  ),
                  const SizedBox(height: 16),
                  PokemonInfoList(
                    title: "Moves",
                    mainColor: pokemon.mainColor,
                    secondaryColor: pokemon.secondaryColor,
                    data: pokemon.moves,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
