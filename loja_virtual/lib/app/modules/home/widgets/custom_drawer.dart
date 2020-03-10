import 'package:flutter/material.dart';

import '../../../app_module.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController = AppModule.to.getBloc();
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildBackground(),
          _buildBody(),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFFF7043), Color(0xFFFFAB91)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return ListView(
      padding: EdgeInsets.all(5),
      children: <Widget>[
        _buildHeader(),
        Divider(
          color: Color(0xFFc63f17),
        ),
        _buildMenuItem(Icons.home, "Início", 0),
        _buildMenuItem(Icons.list, "Produtos", 1),
        _buildMenuItem(Icons.location_on, "Lojas", 2),
        _buildMenuItem(Icons.playlist_add_check, "Meus pedidos", 3),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 120,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              "Loja Virtual",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorDark),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Olá, ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColorDark),
                ),
                GestureDetector(
                  onTap: _entrarOuCadastrar,
                  child: Text(
                    "Entre ou cadastra-se",
                    style: TextStyle(fontSize: 18, color: Color(0xFFffffee)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String name, int page) {
    bool isSelectedPage = page == pageController.page.round();
    Color selectedColor = isSelectedPage
        ? Theme.of(context).primaryColor
        : Theme.of(context).primaryColorDark;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          _navigateToPage(page);
        },
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                icon,
                color: selectedColor,
                size: 30,
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                name,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: selectedColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _navigateToPage(int page) {
    Navigator.of(context).pop();
    pageController.jumpToPage(page);
  }

  void _entrarOuCadastrar() {}
}
