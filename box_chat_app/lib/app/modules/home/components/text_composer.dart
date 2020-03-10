import 'dart:io';

import 'package:box_chat_app/app/model/message.dart';
import 'package:box_chat_app/app/utils/app_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

import '../home_controller.dart';
import '../home_module.dart';

class TextComposer extends StatefulWidget {
  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  final HomeController controller = HomeModule.to.getBloc<HomeController>();
  final FocusNode _focusTextFieldMessage = FocusNode();
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _focusTextFieldMessage.addListener(() async {
      if (_focusTextFieldMessage.hasFocus) {
        try {
          await controller.loginService.performLogin();

          if (await controller.loginService.firebaseAuth.currentUser() ==
              null) {
            _focusTextFieldMessage.unfocus();
          }
        } catch (e) {
          print(e);
          _focusTextFieldMessage.unfocus();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).primaryColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 0),
        padding: EdgeInsets.all(5),
        decoration: (AppUtils.isIOSPlatform(context))
            ? BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                ),
              )
            : null,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.camera_alt),
              onPressed: _takePicture,
            ),
            Expanded(
              child: TextField(
                controller: textController,
                focusNode: _focusTextFieldMessage,
                onChanged: controller.setIsTyping,
                decoration: InputDecoration.collapsed(
                    hintText: "Digite sua mensagem..."),
              ),
            ),
            Observer(
              builder: (_) {
                return AppUtils.isIOSPlatform(context)
                    ? CupertinoButton(
                        child: Text("Enviar"),
                        onPressed: controller.isTyping ? _sendMessage : null,
                      )
                    : IconButton(
                        icon: Icon(Icons.send),
                        onPressed: controller.isTyping ? _sendMessage : null,
                      );
              },
            )
          ],
        ),
      ),
    );
  }

  void _sendMessage() {
    controller.sendMessage(textController.text, () {
      textController.clear();
      controller.setIsTyping(textController.text);
    });
  }

  void _takePicture() async {
    await controller.loginService.performLogin();

    if (await controller.loginService.firebaseAuth.currentUser() != null) {
      File image = await ImagePicker.pickImage(source: ImageSource.camera);

      if (image != null) {
        String url = await controller.uploadImage(image);
        controller.sendImage(url, () {});
      }
    }
  }
}
