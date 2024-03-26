import 'package:either_dart/either.dart';
import 'package:pokedex/src/domain/errors/errors.dart';
import 'package:pokedex/src/external/pokemon_datasource/pokemon_datasource.dart';
import 'package:pokedex/src/infra/model/pokemon_model.dart';
import 'package:pokedex/src/infra/repository/pokemon_repository_interface.dart';

class PokemonRepository extends PokemonRepositoryInterface {
  final PokemonDatasource datasource;

  PokemonRepository({required this.datasource});

  @override
  Stream<Either<Failure, List<PokemonModel>>> catchEmAll() async* {
    try {
      final pokemonStream = datasource.catchEmAll();
      await for (final pokemonList in pokemonStream) {
        yield Right(pokemonList);
      }
    } catch (e) {
      yield const Left(ServerError());
    }
  }
}
