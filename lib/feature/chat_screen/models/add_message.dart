import 'package:chat_app/core/constant/constant.dart';
import 'package:chat_app/core/utils/snackbar_util.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddMessage {
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  Future<void> addMessage(
      {required final String message,
      required final String email,
      required BuildContext context}) {
    return messages.add({
      kMessage: message,
      kCreatedAt: DateTime.now(),
      kEmail: email,
    }).catchError((error) => showSnackBar(
        context: context, message: 'Failed to add message $error'));
  }
}
