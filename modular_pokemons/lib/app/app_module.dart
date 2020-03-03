import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_pokemons/app/app_widget.dart';
import 'package:modular_pokemons/app/network/pokemon_network.dart';
import 'package:modular_pokemons/app/pages/main/main_controller.dart';
import 'package:modular_pokemons/app/pages/main/main_page.dart';
import 'package:modular_pokemons/app/util/consts.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => MainController(i.get<PokemonNetwork>()),
        ),
        Bind(
          (i) => PokemonNetwork(i.get<Dio>()),
        ),
        Bind(
          (i) => Dio(BaseOptions(baseUrl: URL_BASE)),
        )
      ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [Router("/", child: (_, args) => MainPage())];
}
