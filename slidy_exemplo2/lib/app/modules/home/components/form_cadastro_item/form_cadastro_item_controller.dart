import 'package:mobx/mobx.dart';
part 'form_cadastro_item_controller.g.dart';

class FormCadastroItemController = _FormCadastroItemControllerBase with _$FormCadastroItemController;

abstract class _FormCadastroItemControllerBase with Store {
  
  @observable
  String title = "Formulario cadastro";

}