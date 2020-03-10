import 'package:bia_conversation/app/model/message.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  ObservableList<Message> messages = <Message>[].asObservable();

  @observable
  bool isSpeeching = false;

  @action
  clearMessages() {
    messages.clear();
  }

  @action
  addMessage(Message message) {
    messages.add(message);
  }

  @action
  Message getMessage(int index) => messages[index];

  @computed
  int get countMessages => messages.length;

  @action
  changeSpeechStatus(bool isListening) {
    this.isSpeeching = isListening;
  }
}
