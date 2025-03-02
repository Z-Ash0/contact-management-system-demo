import 'dart:math';

import 'package:t3_w3/classes/contact.dart';

enum MessageType { text, audio, video }

enum MessageStatus { deliverd, seen, unseen }

class Message {
  int messageId;
  DateTime timeSent;
  MessageType msgType;
  MessageStatus status;
  Message({this.msgType = MessageType.text, this.status = MessageStatus.unseen})
      : messageId = Random().nextInt(2000),
        timeSent = DateTime.now();

  void sendMessage(Contact sender, Contact receiver, String content,
      {MessageType msgType = MessageType.text,
      MessageStatus msgStatus = MessageStatus.unseen}) {
    print(
        'The $msgType message is sent from $sender to ${receiver.name} and it\'s $msgStatus');
    status = msgStatus;
  }

  bool isSeen() {
    return status == MessageStatus.seen;
  }
}
