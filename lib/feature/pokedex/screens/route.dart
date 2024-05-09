import 'package:flutter/material.dart';
import 'package:pokedex/commom/repositories/pokemon_reposity.dart';
import 'package:pokedex/feature/pokedex/screens/home/container/Home_Container.dart';
import 'details/container/detail_container.dart';


class PokedexRoute extends StatelessWidget {
  const PokedexRoute({super.key, required this.repository});
  final PokemonRepository repository;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) {
              return HomeContainer(
                repository: repository,
                onItemTap: (route, arguments) {
                  Navigator.of(context).pushNamed(route, arguments: arguments);
                },
              );
            },
          );
        }

        if (settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) {
              return DetailContainer(
                repository: repository,
                arguments: (settings.arguments as DetailArguments),
                onBack: () => Navigator.of(context).pop(),
              );
            },
          );
        }
        return null;
      },
    );
  }
}

            
            
    