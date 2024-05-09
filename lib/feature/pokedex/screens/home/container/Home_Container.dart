import 'package:flutter/material.dart';
import 'package:pokedex/commom/errors/failure.dart';
import 'package:pokedex/commom/models/pokemon.dart';
import 'package:pokedex/commom/repositories/pokemon_reposity.dart';
import 'package:pokedex/feature/pokedex/home/pages/Home_Page.dart';
import 'package:pokedex/feature/pokedex/home/pages/Home_error.dart';
import 'package:pokedex/feature/pokedex/screens/home/pages/Home_loading.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repository}) : super(key: key);
  final iPokemonRepository repository;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
     future: repository.getAllPokemons(),
     builder: (context, snapshot) {
      
      if(snapshot.connectionState == ConnectionState.waiting) {
        return HomeLoading();
      }

       if(snapshot.connectionState == ConnectionState.done && 
       snapshot.hasData) {
        return HomePage(list: snapshot.data!);
       }

       if(snapshot.hasError) {
        return HomeError(
          error: (snapshot.error as Failure).message!,
          );
       }

       return Container();
      }
    );
  }
}