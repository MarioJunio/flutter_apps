import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_exemplo_2/modules/main_page/controller.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  Controller controller;

  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode cpfFocus = FocusNode();

  MainPage() {
    nameFocus.addListener(() {
      if (!nameFocus.hasFocus) {
        controller.nameValidator();
        controller.setDirty();
      }
    });

    emailFocus.addListener(() {
      if (!emailFocus.hasFocus) {
        controller.emailValidator();
        controller.setDirty();
      }
    });

    cpfFocus.addListener(() {
      if (!cpfFocus.hasFocus) {
        controller.cpfValidator();
        controller.setDirty();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    controller = Provider.of<Controller>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Pessoa"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Observer(
              builder: (_) => _buildTextField("Nome",
                  onChanged: controller.pessoa.setName,
                  focus: nameFocus,
                  errorMessage: controller.nameRequiredMessage),
            ),
            _buildDivider(),
            Observer(
              builder: (_) => _buildTextField("Email",
                  onChanged: controller.pessoa.setEmail,
                  focus: emailFocus,
                  errorMessage: controller.emailRequiredMessage),
            ),
            _buildDivider(),
            Observer(
              builder: (_) => _buildTextField("CPF",
                  onChanged: controller.pessoa.setCpf,
                  focus: cpfFocus,
                  errorMessage: controller.cpfRequiredMessage),
            ),
            SizedBox(
              height: 30,
            ),
            Observer(
              builder: (_) => Container(
                alignment: Alignment(-0.99, 0.0),
                child: FlatButton(
                  onPressed: !controller.isValid ? null : () {},
                  child: Text("Salvar"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildTextField(String text, {onChanged, focus, errorMessage}) {
    return TextField(
      onChanged: onChanged,
      focusNode: focus,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: text,
          errorText: errorMessage),
    );
  }

  _buildDivider() {
    return Divider(color: Colors.transparent);
  }
}
