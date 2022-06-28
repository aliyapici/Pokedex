import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokemon/constants/ui_helper.dart';
import 'package:pokemon/model/pokemon_model.dart';

class PokeImgAndBall extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeImgAndBall({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String pokeBallImageUrl = 'images/pokeball.png';

    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeBallImageUrl,
            color: Colors.purple.withOpacity(0.3),
            colorBlendMode: BlendMode.modulate,
            width: UIHelper.calculatePokeImgAndBallSizeWidth(),
            height: UIHelper.calculatePokeImgAndBallSizeWidth(),
            fit: BoxFit.fitWidth,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? '',
              height: UIHelper.calculatePokeImgAndBallSizeWidth(),
              width: UIHelper.calculatePokeImgAndBallSizeWidth(),
              fit: BoxFit.fitHeight,
              placeholder: (context, url) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
