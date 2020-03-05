import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:slidy_exemplo2/app/modules/home/components/form_cadastro_item/form_cadastro_item_controller.dart';
import 'package:slidy_exemplo2/app/modules/home/home_module.dart';

class FormCadastroItem extends StatefulWidget {
  @override
  _FormCadastroItemState createState() => _FormCadastroItemState();
}

class _FormCadastroItemState extends State<FormCadastroItem> {
  FormCadastroItemController controller = HomeModule.to.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (_) {
            return Text(controller.title);
          },
        ),
      ),
    );
  }
}
