import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon/model/pokemon_model.dart';
import 'package:pokemon/widgets/poke_list_item.dart';
import '../services/pokedex_api.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokemonListFuture;

  @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> myList = snapshot.data!;
          return GridView.builder(
              itemCount: myList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    ScreenUtil().orientation == Orientation.portrait ? 2 : 3,
              ),
              itemBuilder: (context, index) {
                myList.sort((a, b) {
                  return a.toString().compareTo(b.toString());
                });
                return PokeListItem(pokemon: myList[index]);
              });
        } else if (snapshot.hasError) {
          return const Text('Hata oluştu');
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
      future: _pokemonListFuture,
    );
  }
}
