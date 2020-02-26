import 'package:flutter/material.dart';

void main() => runApp(Home());

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _infoText = "Informe seus dados";
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    weightController.text = "";
    heightController.text = "";

    setState(() {
      _infoText = "";
    });
  }

  void _calculateImc() {
    if (_formKey.currentState.validate()) {
      setState(() {
        double weight = double.parse(weightController.text);
        double height = double.parse(heightController.text) / 100;

        double imc = weight / (height * height);
        String imcFormatted = imc.toStringAsPrecision(4);

        if (imc < 18.6) {
          _infoText = "IMC: $imcFormatted - Abaixo do peso";
        } else if (imc >= 18.6 && imc < 24.9) {
          _infoText = "IMC: $imcFormatted - Peso ideal";
        } else if (imc >= 24.9 && imc < 29.9) {
          _infoText = "IMC: $imcFormatted - Levemente acima do peso";
        } else if (imc >= 29.9 && imc < 34.9) {
          _infoText = "IMC: $imcFormatted - Obesidade grau 1";
        } else if (imc >= 34.9 && imc < 39.9) {
          _infoText = "IMC: $imcFormatted - Obesidade grau 2";
        } else if (imc >= 40) {
          _infoText = "IMC: $imcFormatted - Obesidade grau 3";
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Calculadora de IMC"),
              centerTitle: true,
              backgroundColor: Colors.green,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.refresh),
                  onPressed: _resetFields,
                )
              ],
            ),
            body: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(Icons.person, color: Colors.green, size: 120),
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.green),
                        decoration: InputDecoration(
                            hintText: "Peso (kg)",
                            hintStyle: TextStyle(color: Colors.green)),
                        validator: (value) {
                          return value.isEmpty ? "Informe o peso" : null;
                        },
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: heightController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.green),
                        decoration: InputDecoration(
                            hintText: "Altura (cm)",
                            hintStyle: TextStyle(color: Colors.green)),
                        validator: (value) {
                          return value.isEmpty ? "Informe a altura" : null;
                        },
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
                        child: RaisedButton(
                          onPressed: _calculateImc,
                          child: Text(
                            "Calcular",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        _infoText,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      )
                    ],
                  ),
                ))));
  }
}
