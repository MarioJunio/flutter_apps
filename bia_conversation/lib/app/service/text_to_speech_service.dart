import 'package:flutter_tts/flutter_tts.dart';

enum state { PLAYING, STOPED }

class TextToSpeechService {
  FlutterTts tts = FlutterTts();

  Future speak(String text) {
    tts.setVolume(0.5);
    tts.setSpeechRate(0.5);
    tts.setPitch(1);
    tts.setLanguage("pt-BR");

    if (text != null && text.isNotEmpty) {
      return tts.speak(text);
    }

    return Future.value(0);
  }

  Future stop() => tts.stop();

  Future availableLanguages() => tts.getLanguages;
}
