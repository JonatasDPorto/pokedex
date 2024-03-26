import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/src/external/datasource_interface.dart';
import 'package:pokedex/src/infra/model/pokemon_model.dart';

class PokemonDatasource extends PokemonDatasourceInterface {
  final Dio dio;

  PokemonDatasource(this.dio);

  List<String> _getAllImages(Map data) {
    List<String> result = [];
    for (var e in data.values) {
      if (e is String) {
        if (e.contains('.gif')) {
          result.add(e);
        }
      } else if (e is Map) {
        var mult = _getAllImages(e);
        result.addAll(mult);
      }
    }
    return result;
  }

  String? _getGif(Map data) {
    var frontDefault = data['other']?['showdown']?['front_default'];
    frontDefault ??= data['front_default'];
    return frontDefault;
  }

  Future<List<Map>> _getColors() async {
    return Future.wait(List.generate(10, (index) async {
      var colorId = index + 1;

      var result =
          await dio.get('https://pokeapi.co/api/v2/pokemon-color/$colorId');

      if (result.statusCode == 200) {
        return result.data;
      }
      return {};
    }));
  }

  List<Color> _extractColorByName(String name, List<Map> colorsData) {
    for (var element in colorsData) {
      var pokemons = element['pokemon_species'];
      for (var pokemon in pokemons) {
        if (pokemon['name'].toString().toLowerCase() == name.toLowerCase()) {
          switch (element['name']) {
            case 'green':
              return [Colors.green, Colors.white];
            case 'red':
              return [Colors.red, Colors.white];
            case 'blue':
              return [Colors.blue, Colors.white];
            case 'yellow':
              return [Colors.yellow, Colors.black];
            case 'purple':
              return [Colors.purple, Colors.white];
            case 'pink':
              return [Colors.pink, Colors.white];
            case 'brown':
              return [Colors.brown, Colors.white];
            case 'black':
              return [Colors.black, Colors.white];
            case 'gray':
              return [Colors.grey, Colors.white];
            default:
              return [const Color(0xFFEEEEFF), Colors.black];
          }
        }
      }
    }
    return [Colors.white, Colors.black];
  }

  Future<PokemonModel> _getPokemonData(
      String link, List<Map> colorsData) async {
    var result = await dio.get(link);
    if (result.statusCode == 200) {
      var data = result.data;
      var id = data['id'] ?? '-1';
      var name = data['name'] ?? 'Undefined';
      var images = _getGif(data['sprites'] as Map);
      var colors = _extractColorByName(name, colorsData);
      var mainColor = colors[0];
      var secondaryColor = colors[1];

      return PokemonModel(
        id: id,
        name: data['name'] ?? 'Undefined',
        baseExperience: data['baseExperience'] ?? -1,
        height: (data['height'] ?? 0) / 10,
        isDefault: data['isDefault'] ?? false,
        order: data['order'] ?? 0,
        weight: (data['weight'] ?? 0) / 10,
        mainColor: mainColor,
        secondaryColor: secondaryColor,
        types: (data['types'] as List)
            .map((e) => e['type']['name'] as String)
            .toList(),
        abilities: (data['abilities'] as List)
            .map((e) => e['ability']['name'] as String)
            .toList(),
        moves: (data['moves'] as List)
            .map((e) => e['move']['name'] as String)
            .toList(),
        images: [images],
      );
    } else {
      throw Exception();
    }
  }

  @override
  Stream<List<PokemonModel>> catchEmAll() async* {
    var futures = await Future.wait([
      dio.get("https://pokeapi.co/api/v2/pokemon?limit=-1"),
      _getColors(),
    ]);

    var result = futures[0] as Response;

    var colors = futures[1] as List<Map>;

    if (result.statusCode == 200) {
      var data = (result.data['results'] as List).map((e) => e as Map).toList();

      var chunkSize = 3;

      for (var i = 0; i < data.length; i += chunkSize) {
        var chunk = data.skip(i).take(chunkSize);
        await Future.delayed(const Duration(milliseconds: 100));
        var d = await Future.wait<PokemonModel>(
            chunk.map((e) => _getPokemonData(e['url'], colors)));
        yield d;
      }
    } else {
      throw Exception();
    }
  }
}
