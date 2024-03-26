import 'package:flutter/material.dart';

class PokemonInfoList extends StatelessWidget {
  final String title;
  final List<String> data;
  final Color mainColor;
  final Color secondaryColor;
  const PokemonInfoList({
    super.key,
    required this.title,
    required this.data,
    required this.mainColor,
    required this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(24),
              ),
              border: Border.all(width: 4),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'PokemonPixelFont',
                    fontSize: 60,
                    color: secondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        ListView.builder(
          itemCount: data.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var info = data[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      info,
                      style: const TextStyle(
                        fontFamily: 'PokemonPixelFont',
                        fontSize: 60,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
