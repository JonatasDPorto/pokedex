import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/domain/resources/extensions/string_extension.dart';
import 'package:pulsator/pulsator.dart';

class PokemonCardItem extends StatelessWidget {
  final PokemonEntity pokemon;
  const PokemonCardItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/pokemon', arguments: pokemon);
      },
      child: Container(
        margin: EdgeInsets.only(left: 16, top: 8),
        decoration: BoxDecoration(
          color: pokemon.mainColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        margin: const EdgeInsets.symmetric(horizontal: 32),
                        decoration: BoxDecoration(
                          color: pokemon.secondaryColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(24)),
                        ),
                        child: Text(
                          pokemon.id.toString().pokeID(),
                          style: TextStyle(
                            fontFamily: 'PokemonPixelFont',
                            fontSize: 40,
                            color: pokemon.mainColor,
                          ),
                        ),
                      ),
                      Text(
                        pokemon.name.captalize(),
                        style: TextStyle(
                          fontFamily: 'PokemonPixelFont',
                          fontSize: 40,
                          color: pokemon.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                (pokemon.images.first != null)
                    ? Container(
                        width: 180,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.5),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                          ),
                        ),
                        child: Center(
                          child: Hero(
                            tag: pokemon.id,
                            child: CachedNetworkImage(
                              imageUrl: pokemon.images.first!,
                              filterQuality: FilterQuality.none,
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
                              errorWidget: (context, url, error) => const Image(
                                image:
                                    AssetImage('assets/images/not_found.png'),
                                filterQuality: FilterQuality.none,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
