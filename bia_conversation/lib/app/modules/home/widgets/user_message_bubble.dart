import 'package:flutter/material.dart';

class UserMessageBubble extends StatelessWidget {
  final bool isFirst;
  final String text;

  const UserMessageBubble(this.text, {Key key, this.isFirst = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        _buildUserIcon(),
        _buildMessageBubble(),
      ],
    );
  }

  Widget _buildUserIcon() {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: isFirst
          ? Image(
              image: AssetImage("images/user.png"),
              height: 40,
            )
          : null,
    );
  }

  Widget _buildMessageBubble() {
    return SizedBox(
      child: Container(
        padding: EdgeInsets.all(13),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(0),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          border: Border.all(
            width: 2,
            color: Color.fromRGBO(172, 196, 53, 0.5),
          ),
        ),
      ),
    );
  }
}
