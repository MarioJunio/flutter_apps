import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:bloc_exemplo1/app/modules/cadastro_cliente/cadastro_cliente_controller.dart';
import 'package:bloc_exemplo1/app/modules/cadastro_cliente/cadastro_cliente_module.dart';

void main() {
  initModule(CadastroClienteModule());

  CadastroClienteController cadastrocliente;

  setUp(() {
    cadastrocliente = CadastroClienteModule.to.get<CadastroClienteController>();
  });

  group('CadastroClienteController Test', () {
    //  test("First Test", () {
    //    expect(cadastrocliente, isInstanceOf<CadastroClienteController>());
    //  });

    //  test("Set Value", () {
    //    expect(cadastrocliente.value, equals(0));
    //    cadastrocliente.increment();
    //    expect(cadastrocliente.value, equals(1));
    //  });
  });
}
