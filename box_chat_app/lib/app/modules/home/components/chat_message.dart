import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  bool isLeft;

  ChatMessage({this.isLeft = true});

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
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/women/65.jpg")),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment:
                  isLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "Natalia Souza",
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  "Pariatur reprehenderit laboris pariatur proident Lorem quis aliquip proident veniam amet do do consectetur.",
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.subhead,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
