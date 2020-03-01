import 'package:mobx/mobx.dart';
import 'package:mobx_exemplo_2/modules/main_page/pessoa.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  final pessoa = Pessoa();

  @observable
  String nameRequiredMessage;

  @observable
  String emailRequiredMessage;

  @observable
  String cpfRequiredMessage;

  @observable
  bool dirty = false;

  @computed
  bool get isValid =>
      dirty &&
      nameRequiredMessage == null &&
      emailRequiredMessage == null &&
      cpfRequiredMessage == null;

  @action
  nameValidator() {
    nameRequiredMessage =
        pessoa.name == null || pessoa.name.isEmpty ? "Name is required" : null;
  }

  @action
  emailValidator() {
    if (pessoa.email == null || pessoa.email.isEmpty) {
      emailRequiredMessage = "Email is required";
    } else if (!pessoa.email.contains("@")) {
      emailRequiredMessage = "Email is invalid";
    } else {
      emailRequiredMessage = null;
    }
  }

  @action
  cpfValidator() {
    if (pessoa.cpf == null || pessoa.cpf.isEmpty) {
      cpfRequiredMessage = "CPF is required";
    } else if (pessoa.cpf.length != 11) {
      cpfRequiredMessage = "CPF is invalid";
    } else {
      cpfRequiredMessage = null;
    }
  }

  @action
  setDirty() {
    dirty = true;
  }

  dispose() {}
}
