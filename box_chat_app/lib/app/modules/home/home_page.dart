import 'package:box_chat_app/app/modules/home/components/chat_message.dart';
import 'package:box_chat_app/app/modules/home/components/text_composer.dart';
import 'package:box_chat_app/app/modules/home/home_controller.dart';
import 'package:box_chat_app/app/modules/home/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController controller = HomeModule.to.getBloc<HomeController>();

  @override
  void initState() {
    super.initState();

    _forceLogin();
  }

  void _forceLogin() async {
    try {
      await controller.loginService.performLogin();

      if (controller.loginService.googleSignIn.currentUser == null) {
        _forceLogin();
      } else {
        controller.listenMessages();
      }
    } catch (e) {
      _forceLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Color(0xffeeeeee),
        appBar: AppBar(
          title: Text("Minhas conversas"),
          centerTitle: true,
          elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0 : 5,
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: Observer(
              builder: (_) {
                return ListView.builder(
                  itemBuilder: _messageBuilder,
                  itemCount: controller.messages.length,
                  reverse: true,
                );
              },
            )),
            Container(
              color: Theme.of(context).cardColor,
              child: TextComposer(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _messageBuilder(BuildContext context, int index) {
    return ChatMessage(message: controller.messages[index]);
  }
}
