import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/constants/const.dart';
import 'package:pokemon/constants/ui_helper.dart';
import 'package:pokemon/model/pokemon_model.dart';

class PokeInfo extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInfo({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.w),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: UIHelper.getDefaultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildInfoRow('Name', pokemon.name),
            buildInfoRow('Height', pokemon.height),
            buildInfoRow('Weight', pokemon.weight),
            buildInfoRow('Spawn Time', pokemon.spawnTime),
            buildInfoRow('Weakness', pokemon.weaknesses),
            buildInfoRow('Pre Evolution', pokemon.prevEvolution),
            buildInfoRow('Next Evolution', pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }

  buildInfoRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Constants.getPokeInfoLabelTextStyle(),
        ),
        if (value is List && value.isNotEmpty)
          Text(
            value.join(' , '),
            style: Constants.getPokeInfoTextStyle(),
          )
        else if (value == null)
          Text(
            'Null Available',
            style: Constants.getPokeInfoTextStyle(),
          )
        else
          Text(value),
      ],
    );
  }
}
