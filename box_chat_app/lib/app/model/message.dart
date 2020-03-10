import 'package:mobx/mobx.dart';
part 'message.g.dart';

enum MessageType { TEXT, IMAGE }

class Message = _MessageBase with _$Message;

abstract class _MessageBase with Store {
  String _id;
  String _fromId;
  String _from;
  String _text;
  String _photoUrl;
  MessageType _type;

  _MessageBase(
      {String id,
      String fromId,
      String from,
      String text,
      String photoUrl,
      MessageType type})
      : this._id = id,
        this._fromId = fromId,
        this._from = from,
        this._text = text,
        this._photoUrl = photoUrl,
        this._type = type;

  _MessageBase.fromMap(Map<String, dynamic> map)
      : this._fromId = map["from_id"],
        this._from = map["from"],
        this._text = map["text"],
        this._photoUrl = map["photo_url"],
        this._type = _parseMessageType(map["type"]);

  Map<String, dynamic> toMap() => {
        "from_id": this._fromId,
        "from": this._from,
        "text": this._text,
        "photo_url": this._photoUrl,
        "type": this._type.toString()
      };

  setId(String id) => _id = id;
  String get id => _id;

  setFromId(String fromId) => _fromId = fromId;
  String get fromId => _fromId;

  setFrom(String from) => _from = from;
  String get from => _from;

  setText(String text) => _text = text;
  String get text => _text;

  setPhotoUrl(String photoUrl) => _photoUrl = photoUrl;
  String get photoUrl => _photoUrl;

  setMessageType(MessageType type) => _type = type;
  MessageType get type => _type;

  static MessageType _parseMessageType(String type) {
    switch (type) {
      case "MessageType.TEXT":
        return MessageType.TEXT;
      case "MessageType.IMAGE":
        return MessageType.IMAGE;
    }
  }
}
