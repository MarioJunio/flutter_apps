import 'package:mobx/mobx.dart';
part 'launcher.g.dart';

class Launcher = _LauncherBase with _$Launcher;

enum LauncherType { TRIP, ORDER }
enum LauncherStatus { PENDING, RECEIVABLE, CANCELED, COMPLETED }

abstract class _LauncherBase with Store {
  _LauncherBase(
      {this.id,
      this.description,
      this.observation,
      this.price,
      this.date,
      this.type,
      this.status});

  @observable
  int id;

  @observable
  String description;

  @observable
  String observation;

  @observable
  double price;

  @observable
  DateTime date;

  @observable
  LauncherType type;

  @observable
  LauncherStatus status;

  @action
  setId(int id) => this.id = id;

  @action
  setDescription(String description) => this.description = description;

  @action
  setObservation(String observation) => this.observation = observation;

  @action
  setPrice(double price) => this.price = price;

  @action
  setDate(DateTime date) => this.date = date;

  @action
  setType(LauncherType type) => this.type = type;

  @action
  setStatus(LauncherStatus status) => this.status = status;
}
