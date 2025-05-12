import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../core/constant/constant.dart';
import '../models/message_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  final List<Message> messagesList = [];
  final CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  Future<void> sendMessage({
    required final String message,
    required final String email,
  }) {
    return messages.add({
      kMessage: message,
      kCreatedAt: DateTime.now(),
      kEmail: email,
    });
  }

  void getMessages() {
    messages.orderBy(kCreatedAt).snapshots().listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messages: messagesList));
    });
  }
}
