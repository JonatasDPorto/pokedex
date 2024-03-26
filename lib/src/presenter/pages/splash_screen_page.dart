import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/src/domain/resources/colors/colors.dart';
import 'package:pokedex/src/presenter/stores/pokemon_store.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.read<PokemonStore>();
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Pokedex",
              style: TextStyle(
                fontFamily: "PokemonSolid",
                color: Colors.white,
                fontSize: 60,
                letterSpacing: 4,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "by Jônatas",
                style: TextStyle(
                  fontFamily: "PokemonSolid",
                  color: Colors.white,
                  fontSize: 16,
                  letterSpacing: 4,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: SizedBox(
                width: 100,
                height: 100,
                child: FutureBuilder(
                  future: store.catchEmAll(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Container();
                    }
                    if (snapshot.hasError) {
                      return Container();
                    }
                    return const CircularProgressIndicator(
                      color: AppColors.white,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
