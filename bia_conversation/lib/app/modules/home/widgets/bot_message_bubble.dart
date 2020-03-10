import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BotMessageBubble extends StatelessWidget {
  final bool isFirst;
  final String text;

  const BotMessageBubble(this.text, {Key key, this.isFirst = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          ? SizedBox(
              width: 40,
              child: SvgPicture.asset("images/bot.svg"),
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
              topLeft: Radius.circular(0),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          border: Border.all(
            width: 2,
            color: Color.fromRGBO(212, 212, 212, 0.5),
          ),
        ),
      ),
    );
  }
}
