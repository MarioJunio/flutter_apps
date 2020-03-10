import 'package:flutter/material.dart';
import 'package:loja_virtual/app/modules/apresentation/apresentation_module.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          ApresentationModule(),
        ],
      ),
    );
  }
}
