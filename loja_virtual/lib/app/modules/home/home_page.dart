import 'package:flutter/material.dart';
import 'package:loja_virtual/app/modules/apresentation/apresentation_module.dart';
import 'package:loja_virtual/app/modules/produtos/produtos_module.dart';

import '../../app_module.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = AppModule.to.getBloc();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          ApresentationModule(),
          ProdutosModule()
        ],
      ),
    );
  }
}
