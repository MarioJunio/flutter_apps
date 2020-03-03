import 'package:mobx/mobx.dart';
import 'package:modular_pokemons/app/model/pokemon.dart';
import 'package:modular_pokemons/app/network/pokemon_network.dart';
part 'main_controller.g.dart';

class MainController = _MainControllerBase with _$MainController;

abstract class _MainControllerBase with Store {
  PokemonNetwork pokemonNetwork;

  _MainControllerBase(PokemonNetwork pokemonNetwork)
      : this.pokemonNetwork = pokemonNetwork;

  @observable
  ObservableFuture<List<Pokemon>> pokemons = ObservableFuture.value([]);

  @action
  all() {
    pokemons = pokemonNetwork.all().asObservable() ?? [];
  }
}
