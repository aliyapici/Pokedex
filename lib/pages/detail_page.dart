import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/constants/ui_helper.dart';
import 'package:pokemon/model/pokemon_model.dart';
import 'package:pokemon/widgets/poke_info.dart';
import 'package:pokemon/widgets/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;

  DetailPage({Key? key, required this.pokemon}) : super(key: key);

  String pokeBallImageUrl = 'images/pokeball.png';

  @override
  Widget build(BuildContext context) {
    return ScreenUtil().orientation == Orientation.portrait
        ? buildPortraitBody(context, pokeBallImageUrl)
        : buildLandscapeBody(context);
  }

  Scaffold buildPortraitBody(BuildContext context, String pokeBallImageUrl) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: UIHelper.getIconPadding(),
                  child: IconButton(
                    iconSize: 18.w,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                ),
                PokeTypeName(pokemon: pokemon),
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                    child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Image.asset(
                        pokeBallImageUrl,
                        height: 0.15.sh,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        top: 0.09.sh,
                        child: PokeInfo(pokemon: pokemon)),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Hero(
                        tag: pokemon.id!,
                        child: CachedNetworkImage(
                          imageUrl: pokemon.img ?? '',
                          height: 0.20.sh,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Scaffold buildLandscapeBody(BuildContext context) {
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: UIHelper.getIconPadding(),
              child: IconButton(
                iconSize: 18.w,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PokeTypeName(pokemon: pokemon),
                        Hero(
                          tag: pokemon.id!,
                          child: CachedNetworkImage(
                            imageUrl: pokemon.img ?? '',
                            height: 0.20.sw,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Padding(
                        padding: UIHelper.getDefaultPadding(),
                        child: PokeInfo(pokemon: pokemon),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
