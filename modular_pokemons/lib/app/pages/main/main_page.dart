import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_pokemons/app/model/pokemon.dart';
import 'package:modular_pokemons/app/pages/main/main_controller.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainController controller = Modular.get<MainController>();

  @override
  void initState() {
    super.initState();
    controller.all();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Observer(
              builder: (_) => FutureBuilder(
                  future: controller.pokemons,
                  builder: (_, snap) {
                    if (snap.connectionState == ConnectionState.active ||
                        snap.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 1,
                        ),
                      );
                    }

                    final List<Pokemon> pokemons = snap.data;

                    return ListView.builder(
                      itemBuilder: (_, int index) =>
                          _buildListItem(pokemons[index]),
                      itemCount: pokemons.length,
                    );
                  }),
            )));
  }

  Widget _buildListItem(Pokemon pokemon) {
    return ListTile(
      title: Text(pokemon.name),
    );
  }
}
