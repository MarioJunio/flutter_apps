import 'package:slidy_exemplo2/app/modules/home/components/form_cadastro_item/form_cadastro_item.dart';
import 'package:slidy_exemplo2/app/modules/home/components/form_cadastro_item/form_cadastro_item_controller.dart';
import 'package:slidy_exemplo2/app/modules/home/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_exemplo2/app/modules/home/home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => FormCadastroItemController()),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router("/cadastro", child: (_, args) => FormCadastroItem())
      ];

  static Inject get to => Inject<HomeModule>.of();
}
