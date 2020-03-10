import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loja_virtual/app/modules/apresentation/apresentation_controller.dart';
import 'package:loja_virtual/app/modules/apresentation/apresentation_module.dart';
import 'package:loja_virtual/app/modules/home/widgets/custom_drawer.dart';
import 'package:transparent_image/transparent_image.dart';

class ApresentationPage extends StatefulWidget {
  @override
  _ApresentationPageState createState() => _ApresentationPageState();
}

class _ApresentationPageState extends State<ApresentationPage> {
  ApresentationController controller =
      ApresentationModule.to.getBloc<ApresentationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Stack(
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
            title: Text(
              "Novidades",
              style: TextStyle(color: Theme.of(context).primaryColorDark),
            ),
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
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor:
                  AlwaysStoppedAnimation(Theme.of(context).primaryColorDark),
            ),
          ),
        ),
      );
    }

    List<DocumentSnapshot> documents = snapshot.data.documents;
    List<StaggeredTile> tiles = documents
        .map((doc) => StaggeredTile.count(doc.data["x"], doc.data["y"]))
        .toList();

    List<Widget> images = documents
        .map((doc) => FadeInImage.memoryNetwork(
            fit: BoxFit.cover,
            placeholder: kTransparentImage,
            image: doc.data["image"]))
        .toList();

    return SliverStaggeredGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      staggeredTiles: tiles,
      children: images,
    );
  }
}
