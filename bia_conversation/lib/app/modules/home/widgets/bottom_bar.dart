import 'package:bia_conversation/app/model/message.dart';
import 'package:bia_conversation/app/modules/home/home_controller.dart';
import 'package:bia_conversation/app/modules/home/home_module.dart';
import 'package:bia_conversation/app/service/speech_to_text_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final HomeController controller = HomeModule.to.getBloc<HomeController>();
  final SpeechToTextService sttService =
      HomeModule.to.getDependency<SpeechToTextService>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Color(0xffbeeeeee), blurRadius: 5),
          ],
        ),
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildHomeButton(),
              _buildMicButton(),
              _buildListActionsButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeButton() {
    return _buildIconButton(
      Icons.home,
      _clear,
    );
  }

  Widget _buildMicButton() {
    return SizedBox(
      width: 150,
      child: Container(
        child: Observer(
          builder: (_) {
            return _buildIconButton(
                controller.isSpeeching ? Icons.more_horiz : Icons.mic,
                _toggleSpeech);
          },
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Color(0xFFCCCCCC), blurRadius: 1, offset: Offset(0.0, 4))
          ],
        ),
      ),
    );
  }

  Widget _buildListActionsButton() {
    return _buildIconButton(Icons.menu, () {});
  }

  Widget _buildIconButton(IconData icon, Function onPress) {
    return IconButton(
      iconSize: 30,
      color: Colors.black54,
      icon: Icon(icon),
      onPressed: onPress,
    );
  }

  void _toggleSpeech() {
    sttService.startToggle(
        onStatus: _statusListener,
        onResult: _resultListener,
        onError: _errorListener);
  }

  void _clear() {
    controller.clearMessages();
  }

  void _statusListener(String status) {
    controller.changeSpeechStatus(sttService.stt.isListening);
  }

  void _resultListener(SpeechRecognitionResult result) {
    if (result.finalResult) {
      Message message = Message(text: result.recognizedWords, isBot: false);
      controller.addMessage(message);

      Message response = Message(text: "Oi, eu sou a Bia!", isBot: true);
      controller.addMessage(response);
    }
  }

  void _errorListener(SpeechRecognitionError error) {
    print("_errorListener -> ${error.errorMsg}");
  }
}
