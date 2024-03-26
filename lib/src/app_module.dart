import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/domain/entities/pokemon_entity.dart';
import 'package:pokedex/src/external/pokemon_datasource/pokemon_datasource.dart';
import 'package:pokedex/src/external/repository/pokemon_repository.dart';
import 'package:pokedex/src/presenter/pages/pokedex_page.dart';
import 'package:pokedex/src/presenter/pages/pokemon_page.dart';
import 'package:pokedex/src/presenter/pages/splash_screen_page.dart';
import 'package:pokedex/src/presenter/stores/pokemon_store.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addInstance(Dio());
    i.add<PokemonDatasource>(PokemonDatasource.new);
    i.add<PokemonRepository>(PokemonRepository.new);
    i.addSingleton<PokemonStore>(PokemonStore.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashScreenPage());
    r.child('/pokedex', child: (context) => const PokedexPage());
    r.child('/pokemon', child: (_) {
      var pokemon = r.args.data as PokemonEntity;
      return PokemonPage(
        pokemon: pokemon,
      );
    });
  }
}
