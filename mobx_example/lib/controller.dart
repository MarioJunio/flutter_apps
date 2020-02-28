import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  int _sum = 0;

  @observable
  double firstValue = 0;

  @observable
  double secondValue = 0;

  @computed
  double get sum => firstValue + secondValue;

  @action
  changeFirstValue(String text) {
    firstValue = double.parse(text);
  }

  @action
  changeSecondValue(String text) {
    secondValue = double.parse(text);
  }
}
