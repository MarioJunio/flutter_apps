import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  @observable
  ObservableList cars = ["A3", "S3", "RS3"].asObservable();

  @observable
  String _car;

  @action
  void setCar(String car) => _car = car;

  @action
  void save() {
    cars.add(_car);
  }

  @action
  void remove(int index) {
    cars.removeAt(index);
  }

}
