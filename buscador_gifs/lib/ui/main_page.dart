import 'package:buscador_gifs/api/giphy_api.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Image.network(
            "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Pesquisar GIF",
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _load(),
              builder: _buildGifs,
            ),
          )
        ],
      ),
    );
  }

  Future<Map> _load() {
    return GiphyApi.trending();
  }

  Widget _buildGifs(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
      case ConnectionState.waiting:
      case ConnectionState.active:
        return Center(
          child: CircularProgressIndicator(
            strokeWidth: 3,
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ),
        );

      case ConnectionState.done:
        return _buildGifsGrid(context, snapshot);
    }
  }

  Widget _buildGifsGrid(BuildContext context, AsyncSnapshot snapshot) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        final imgUrl =
            snapshot.data["data"][index]["images"]["fixed_height"]["url"];
        return GestureDetector(
          child: Image.network(
            imgUrl,
            fit: BoxFit.cover,
          ),
        );
      },
      itemCount: snapshot.data["pagination"]["count"],
      padding: EdgeInsets.all(10),
    );
  }
}
