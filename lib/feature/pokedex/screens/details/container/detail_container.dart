import 'package:flutter/material.dart';
import 'package:pokedex/commom/errors/failure.dart';
import 'package:pokedex/commom/models/pokemon.dart';
import 'package:pokedex/commom/repositories/pokemon_reposity.dart';
import 'package:pokedex/commom/widgets/po_error.dart';
import 'package:pokedex/commom/widgets/po_loading.dart';
import 'package:pokedex/feature/pokedex/screens/details/pages/datail_page.dart';

class DetailArguments {
  DetailArguments({required this.name, required Pokemon pokemon, required int index});
  final String name;
}


class DetailContainer extends StatelessWidget {
  const DetailContainer(
    {Key? key, required this.repository, required this.arguments, required void Function() onBack}) : super(key: key);
  final iPokemonRepository repository;
  final DetailArguments arguments;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
     future: repository.getAllPokemons(),
     builder: (context, snapshot) {
      
      if(snapshot.connectionState == ConnectionState.waiting) {
        return PoLoading();
      }

       if(snapshot.connectionState == ConnectionState.done && 
       snapshot.hasData) {
        return DetailPage(name: arguments.name, list: snapshot.data!);
       }

       if(snapshot.hasError) {
        return PoError(
          error: (snapshot.error as Failure).message!,
          );
       }

       return Container();
      }
    );
  }
}