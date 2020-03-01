import 'package:mobx/mobx.dart';
import 'package:mobx_exemplo3/model/launcher.dart';
part 'main_page_controller.g.dart';

class MainPageController = _MainPageControllerBase with _$MainPageController;

abstract class _MainPageControllerBase with Store {
  @observable
  ObservableList<Launcher> launchers = [
    Launcher(
        id: 1,
        description: "Mario",
        observation: "Monte Carmelo -> Udi",
        date: DateTime.now(),
        price: 35,
        type: LauncherType.TRIP,
        status: LauncherStatus.PENDING),
    Launcher(
        id: 2,
        description: "Isadora",
        observation: "Udi -> Coromandel",
        date: DateTime.utc(2020, DateTime.march, 5),
        price: 50,
        type: LauncherType.TRIP,
        status: LauncherStatus.PENDING),
    Launcher(
        id: 3,
        description: "Nadir",
        observation: "Encomenda, entregar na Rossana Aviamentos",
        date: DateTime.utc(2020, DateTime.march, 3),
        price: 25,
        type: LauncherType.ORDER,
        status: LauncherStatus.RECEIVABLE),
  ].asObservable();

  @observable
  String _filter;

  @observable
  Launcher _formLauncher;

  @computed
  List<Launcher> get filterLaunchers => _filter != null && _filter.isNotEmpty
      ? launchers
          .where((element) =>
              element.description.toLowerCase().contains(_filter.toLowerCase()))
          .toList()
      : launchers;

  @action
  void addLauncher(Launcher launcher) {
    launcher.setId(_maxId() + 1);
    launchers.add(launcher);
  }

  @action
  void remove(int id) {
    launchers.removeWhere((element) => element.id == id);
  }

  @action
  void setFilter(String filter) => this._filter = filter;

  @computed
  Launcher get formLauncher => _formLauncher;

  @action
  void setFormLauncher(Launcher launcher) => this._formLauncher = launcher;

  int _maxId() {
    int max = launchers.first.id;

    this.launchers.forEach((element) {
      max = element.id > max ? element.id : max;
    });

    return max;
  }
}
