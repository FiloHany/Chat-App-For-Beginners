import 'package:chat_app/constants.dart';

class Message {
  final String message;
  final String user;

  Message(this.message,this.user);

  factory Message.fromJson(jsonData){
    return Message(jsonData[kMessage], jsonData[kUser]);
  }
}