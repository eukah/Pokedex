import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:pokedex/commom/repositories/pokemon_reposity.dart';
import 'package:pokedex/feature/pokedex/screens/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PokedexRoute(
        repository: PokemonRepository(
          dio: Dio(),
        ),
      ),
    );
  }
}
