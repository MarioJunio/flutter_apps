import 'package:bia_conversation/app/modules/home/home_controller.dart';
import 'package:bia_conversation/app/service/speech_to_text_service.dart';
import 'package:bia_conversation/app/service/text_to_speech_service.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:bia_conversation/app/modules/home/home_page.dart';

class HomeModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => HomeController()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => SpeechToTextService()),
        Dependency((i) => TextToSpeechService()),
      ];

  @override
  Widget get view => HomePage();

  static Inject get to => Inject<HomeModule>.of();
}
