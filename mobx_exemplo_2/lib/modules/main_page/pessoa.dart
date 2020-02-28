import 'package:mobx/mobx.dart';
part 'pessoa.g.dart';

class Pessoa = _PessoaBase with _$Pessoa;

abstract class _PessoaBase with Store {
  
  @observable
  String name;

  @observable
  String cpf;

  @observable
  String email;

  @action
  setName(String name) => this.name = name;

  @action
  setCpf(String cpf) => this.cpf = cpf;

  @action
  setEmail(String email) => this.email = email; 
}