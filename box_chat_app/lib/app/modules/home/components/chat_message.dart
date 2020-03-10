import 'package:box_chat_app/app/model/message.dart';
import 'package:box_chat_app/app/modules/home/home_controller.dart';
import 'package:box_chat_app/app/modules/home/home_module.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final HomeController controller = HomeModule.to.getBloc<HomeController>();
  Message message;
  bool isLeft = true;

  ChatMessage({this.message}) {
    var user = controller.loginService.googleSignIn.currentUser;

    if (user != null) {
      this.isLeft = user.id != this.message.fromId; 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.all(6),
      child: Row(
        textDirection: isLeft ? TextDirection.ltr : TextDirection.rtl,
        children: <Widget>[
          Container(
            margin: isLeft
                ? const EdgeInsets.only(right: 10)
                : const EdgeInsets.only(left: 10),
            child:
                CircleAvatar(backgroundImage: NetworkImage(message.photoUrl)),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  message.from,
                  style: Theme.of(context).textTheme.title,
                ),
                _buildMessageBody(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildMessageBody(BuildContext context) {
    return (message.type == MessageType.TEXT)
        ? Text(
            message.text,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.subhead,
          )
        : Image.network(message.text);
  }
}
