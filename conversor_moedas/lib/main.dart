import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

const financeApi = "https://api.hgbrasil.com/finance?format=json&key=b4a3d0b5";

void main() async {
  await getData();

  runApp(Home());
}

Future<Map> getData() async {
  http.Response response = await http.get(financeApi);
  return jsonDecode(response.body);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _dolar;
  double _euro;

  TextEditingController _realController = TextEditingController();
  TextEditingController _dolarController = TextEditingController();
  TextEditingController _euroController = TextEditingController();

  Widget _buildTextField(String text, String prefix,
      TextEditingController controller, Function onChanged) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: TextStyle(color: Colors.amber),
      decoration: InputDecoration(
          border: OutlineInputBorder(), labelText: text, prefixText: prefix),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
    );
  }

  Widget _buildDivider() {
    return Divider(color: Colors.transparent);
  }

  bool _fieldChangedClearAll(String text) {
    if (text.isEmpty) {
      _clearAll();
      return true;
    }

    return false;
  }

  void _realFieldChanged(String text) {
    if (_fieldChangedClearAll(text)) {
      return;
    }

    double real = double.parse(text);

    _dolarController.text = (real / _dolar).toStringAsFixed(2);
    _euroController.text = (real / _euro).toStringAsFixed(2);
  }

  void _dolarFieldChanged(String text) {
    if (_fieldChangedClearAll(text)) {
      return;
    }

    double dolar = double.parse(text);

    _realController.text = (dolar * _dolar).toStringAsFixed(2);
    _euroController.text = (dolar * _dolar / _euro).toStringAsFixed(2);
  }

  void _euroFieldChanged(String text) {
    if (_fieldChangedClearAll(text)) {
      return;
    }

    double euro = double.parse(text);

    _realController.text = (euro * _euro).toStringAsFixed(2);
    _dolarController.text = (euro * _euro / _dolar).toStringAsFixed(2);
  }

  void _clearAll() {
    _realController.text = "";
    _dolarController.text = "";
    _euroController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.amber,
            hintColor: Colors.amberAccent,
            cursorColor: Colors.amberAccent,
            textSelectionColor: Colors.amberAccent,
            inputDecorationTheme: InputDecorationTheme(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.amber)))),
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: <Widget>[
              IconButton(icon: Icon(Icons.refresh), onPressed: _clearAll)
            ],
            backgroundColor: Colors.amber,
            title: Text('Conversor de Moedas'),
            centerTitle: true,
          ),
          body: FutureBuilder<Map>(
            future: getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                      child: Text(
                    "Carregando...",
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ));
                case ConnectionState.done:
                  _dolar = snapshot.data['results']['currencies']['USD']['buy'];
                  _euro = snapshot.data['results']['currencies']['EUR']['buy'];

                  return SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        _buildDivider(),
                        Icon(
                          Icons.monetization_on,
                          size: 80,
                          color: Colors.amberAccent,
                        ),
                        _buildDivider(),
                        _buildTextField(
                            "Reais", "R\$", _realController, _realFieldChanged),
                        _buildDivider(),
                        _buildTextField("Dolar", "U\$", _dolarController,
                            _dolarFieldChanged),
                        _buildDivider(),
                        _buildTextField(
                            "Euro", "€", _euroController, _euroFieldChanged)
                      ],
                    ),
                  );

                default:
                  if (snapshot.hasError) {
                    return Container(
                      color: Colors.red,
                      child: Text("Problema ao carregar os dados remotos"),
                      alignment: Alignment.center,
                    );
                  }
              }
            },
          ),
        ));
  }
}
