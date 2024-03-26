import 'package:either_dart/either.dart';
import 'package:pokedex/src/domain/errors/errors.dart';
import 'package:pokedex/src/infra/model/pokemon_model.dart';

abstract class PokemonRepositoryInterface {
  Stream<Either<Failure, List<PokemonModel>>> catchEmAll();
}
