import 'package:pokedex/src/infra/model/pokemon_model.dart';

sealed class Datasource {}

abstract class PokemonDatasourceInterface extends Datasource {
  Stream<List<PokemonModel>> catchEmAll();
}
