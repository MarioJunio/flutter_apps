import 'package:dio/dio.dart';
import 'package:modular_pokemons/app/model/pokemon.dart';

class PokemonNetwork {
  Dio dio;

  PokemonNetwork(Dio dio) {
    this.dio = dio;
  }

  Future<List<Pokemon>> all() async {
    final result = await dio.get("/pokemon");
    await Future.delayed(Duration(seconds: 3));
    List<Pokemon> pokemons = [];

    for (var item in result.data["results"]) {
      pokemons.add(Pokemon(name: item["name"]));
    } 

    return pokemons;
  }

}