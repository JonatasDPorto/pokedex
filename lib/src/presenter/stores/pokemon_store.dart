import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/src/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/external/repository/pokemon_repository.dart';
part 'pokemon_store.g.dart';

class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  final PokemonRepository repository;
  _PokemonStoreBase({required this.repository});

  @observable
  ObservableList<PokemonEntity> pokemons = <PokemonEntity>[].asObservable();

  @action
  Future<bool> catchEmAll() async {
    Completer<bool> completer = Completer<bool>();
    repository.catchEmAll().listen(
      (pokemonList) {
        if (pokemonList.isRight) {
          pokemons.addAll(pokemonList.right);
          if (pokemons.length > 100 && !completer.isCompleted) {
            completer.complete(true);
            Future.delayed(const Duration(milliseconds: 300)).then((value) {
              Modular.to.pushNamed('/pokedex');
            });
          }
        } else {
          print("Error loading some pokemons!");
        }
      },
      onDone: () {
        if (completer.isCompleted) return;
        completer.complete(true);
      },
    );
    return completer.future;
  }
}
