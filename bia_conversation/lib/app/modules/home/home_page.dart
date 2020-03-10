import 'package:bia_conversation/app/model/message.dart';
import 'package:bia_conversation/app/modules/home/home_controller.dart';
import 'package:bia_conversation/app/modules/home/home_module.dart';
import 'package:bia_conversation/app/modules/home/widgets/bot_message_bubble.dart';
import 'package:bia_conversation/app/modules/home/widgets/bottom_bar.dart';
import 'package:bia_conversation/app/modules/home/widgets/user_message_bubble.dart';
import 'package:bia_conversation/app/service/text_to_speech_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeModule.to.getBloc<HomeController>();
  final TextToSpeechService ttsService = HomeModule.to.getDependency<TextToSpeechService>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFFFAFAFA),
          body: Container(
            padding: EdgeInsets.all(5),
            child: Observer(
              builder: (_) {
                return _buildMessagesList();
              },
            ),
          ),
          bottomNavigationBar: BottomBar()),
    );
  }

  Widget _buildMessagesList() {
    return ListView.builder(
      itemBuilder: (context, index) => _buildMessage(index),
      itemCount: controller.countMessages,
    );
  }

  Widget _buildMessage(int index) {
    Message message = controller.getMessage(index);
    bool isFirst = index <= 1;

    if (message.isBot) {
      ttsService.speak(message.text);
    }

    return message.isBot
        ? BotMessageBubble(
            message.text,
            isFirst: isFirst,
          )
        : UserMessageBubble(
            message.text,
            isFirst: isFirst,
          );
  }
}
