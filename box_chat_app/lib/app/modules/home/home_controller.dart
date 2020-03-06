import 'package:box_chat_app/app/app_module.dart';
import 'package:box_chat_app/app/services/login_service.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final LoginService loginService = AppModule.to.getDependency<LoginService>();

  @observable
  bool isTyping = false;

  @action
  setIsTyping(String text) => isTyping = text.length > 0;
}
