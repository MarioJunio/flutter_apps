import 'package:flutter/material.dart';
import 'package:loja_virtual/app/modules/apresentation/apresentation_controller.dart';
import 'package:loja_virtual/app/modules/apresentation/apresentation_module.dart';

class ApresentationPage extends StatefulWidget {
  @override
  _ApresentationPageState createState() => _ApresentationPageState();
}

class _ApresentationPageState extends State<ApresentationPage> {
  ApresentationController controller =
      ApresentationModule.to.getBloc<ApresentationController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildBackground(),
        _buildBody(),
      ],
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 211, 118, 130),
            Color.fromARGB(255, 253, 181, 168)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _buildBody() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.transparent,
          floating: true,
          snap: true,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("Novidades"),
            centerTitle: true,
          ),
        ),
        FutureBuilder(future: controller.images, builder: _gridBuilder)
      ],
    );
  }

  Widget _gridBuilder(context, AsyncSnapshot snapshot) {
    if (!snapshot.hasData) {
      return SliverToBoxAdapter(
        child: Container(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.blue),
          ),
        ),
      );
    }

    return SliverToBoxAdapter(
      child: Container(
        color: Colors.amber,
      ),
    );
  }
}
