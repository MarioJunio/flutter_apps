import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  bool isTyping = false;

  @action
  setIsTyping(String text) => isTyping = text.length > 0;
}
