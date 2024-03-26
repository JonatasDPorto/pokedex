// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PokemonStore on _PokemonStoreBase, Store {
  late final _$pokemonsAtom =
      Atom(name: '_PokemonStoreBase.pokemons', context: context);

  @override
  ObservableList<PokemonEntity> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(ObservableList<PokemonEntity> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  late final _$catchEmAllAsyncAction =
      AsyncAction('_PokemonStoreBase.catchEmAll', context: context);

  @override
  Future<bool> catchEmAll() {
    return _$catchEmAllAsyncAction.run(() => super.catchEmAll());
  }

  @override
  String toString() {
    return '''
pokemons: ${pokemons}
    ''';
  }
}
