import 'package:buscador_gifs/api/giphy_api.dart';
import 'package:buscador_gifs/ui/gif_page.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:transparent_image/transparent_image.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _text;
  int _offset;

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
              style: TextStyle(color: Colors.white),
              onSubmitted: (text) {
                setState(() {
                  _text = text;
                  _offset = 0;
                });
              },
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
    return GiphyApi.search(text: _text, offset: _offset);
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
    int pageCount = snapshot.data["pagination"]["count"];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        if (index < pageCount) {
          final gif = snapshot.data["data"][index];
          final imgUrl = gif["images"]["fixed_height"]["url"];

          return GestureDetector(
            onLongPress: () {
              Share.share(imgUrl);
            },
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GifPage(gif)));
            },
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: imgUrl,
              fit: BoxFit.cover,
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              setState(() {
                _offset += pageCount;
                print("offset: $_offset");
              });
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 60,
            ),
          );
        }
      },
      itemCount: _countGifsLoaded(pageCount),
      padding: EdgeInsets.all(10),
    );
  }

  int _countGifsLoaded(int count) =>
      _text != null && _text.isNotEmpty ? count + 1 : count;
}
