import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx_exemplo3/model/launcher.dart';
import 'package:mobx_exemplo3/modules/main_page/main_page_controller.dart';
import 'package:mobx_exemplo3/utils/Dates.dart';

class DialogFormItem extends StatefulWidget {
  @override
  _DialogFormItemState createState() => _DialogFormItemState();
}

class _DialogFormItemState extends State<DialogFormItem> {
  MainPageController controller = GetIt.I.get<MainPageController>();

  _DialogFormItemState({Launcher launcher}) {
    controller
        .setFormLauncher(launcher ?? Launcher(status: LauncherStatus.PENDING));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Novo lançamento"),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Observer(
                      builder: (_) {
                        return _radioButton("Viagem", LauncherType.TRIP,
                            controller.formLauncher.type, _typeChange);
                      },
                    ),
                    Observer(
                      builder: (_) {
                        return _radioButton("Encomenda", LauncherType.ORDER,
                            controller.formLauncher.type, _typeChange);
                      },
                    )
                  ],
                ),
                Observer(
                  builder: (_) {
                    return _textField("Descrição", TextInputType.text,
                        onChange: (text) =>
                            controller.formLauncher.setDescription(text));
                  },
                ),
                Observer(
                  builder: (_) {
                    return _textField("Valor", TextInputType.number,
                        onSubmit: (text) => controller.formLauncher
                            .setPrice(double.parse(text)));
                  },
                ),
                Observer(
                  builder: (_) {
                    return _textField("Data", TextInputType.datetime,
                        onSubmit: (text) =>
                            controller.formLauncher.setDate(Dates.parse(text)));
                  },
                ),
                Observer(
                  builder: (_) {
                    return _textField("Observação...", TextInputType.multiline,
                        maxLines: 3,
                        onChange: (text) =>
                            controller.formLauncher.setObservation(text));
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: RaisedButton.icon(
                      color: Colors.blue,
                      onPressed: _saveLaunch,
                      icon: Icon(Icons.save, color: Colors.white),
                      label: Text(
                        "Salvar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )));
  }

  void _saveLaunch() {
    controller.addLauncher(controller.formLauncher);
    controller.setFormLauncher(Launcher());

    Navigator.pop(context);
  }

  void _typeChange(value) {
    controller.formLauncher.setType(value);
  }

  Widget _radioButton(String title, value, groupValue, onChanged) {
    return Row(
      children: <Widget>[
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(title)
      ],
    );
  }

  Widget _textField(String hint, TextInputType inputType,
      {onChange, onSubmit, maxLines = 1}) {
    return TextField(
      onChanged: onChange,
      maxLines: maxLines,
      onSubmitted: onSubmit,
      keyboardType: inputType,
      decoration: InputDecoration(hintText: hint),
    );
  }
}
