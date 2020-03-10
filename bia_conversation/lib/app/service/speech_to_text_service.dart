import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextService {
  final SpeechToText stt = SpeechToText();

  Future<bool> startToggle(
      {Function onStatus, Function onResult, Function onError}) async {
    if (stt.isListening) {
      _stopListening();
    } else {
      bool available =
          await stt.initialize(onStatus: onStatus, onError: onError);

      if (available) {
        stt.listen(onResult: onResult);
      } else {
        print("The user has denied the use of speech recognition.");
        stt.cancel();
      }
    }
  }

  void _stopListening() {
    if (stt.isListening) {
      stt.stop();
    }
  }
}
