import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/presenter/stores/pokemon_store.dart';
import 'package:pokedex/src/presenter/widgets/pokemon_card_item.dart';

class PokedexPage extends StatelessWidget {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<PokemonStore>();
    return Scaffold(
      body: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 42,
                  height: 42,
                  child: Image(
                    image: AssetImage('assets/images/pokebola.png'),
                  ),
                ),
              ),
              Text(
                "Pokedex",
                style: TextStyle(
                  fontFamily: "PokemonSolid",
                  color: Colors.red,
                  fontSize: 30,
                  letterSpacing: 4,
                ),
              ),
            ],
          ),
          Expanded(
            child: Observer(
              builder: (context) {
                return ListView.builder(
                  itemCount: store.pokemons.length,
                  itemBuilder: (context, index) {
                    var pokemon = store.pokemons[index];
                    return PokemonCardItem(pokemon: pokemon);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
