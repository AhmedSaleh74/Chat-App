import 'package:chat_app/core/constant/constant.dart';

class Message {
  final String message;
  final String email;

  Message({required this.message, required this.email});

  factory Message.fromJson(final jsonData) {
    return Message(message: jsonData[kMessage], email: jsonData[kEmail]);
  }
}
