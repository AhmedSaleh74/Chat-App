import 'package:chat_app/core/utils/snackbar_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void handleAuthError(BuildContext context, Object error) {
  if (error is FirebaseAuthException) {
    switch (error.code) {
      case 'weak-password':
        showSnackBar(
            context: context, message: 'The password provided is too weak.');
        break;
      case 'email-already-in-use':
        showSnackBar(
            context: context,
            message: 'The account already exists for that email.');
        break;
      case 'user-not-found':
        showSnackBar(
            context: context, message: 'No user found for that email.');
        break;
      case 'wrong-password':
        showSnackBar(context: context, message: 'Wrong password provided.');
        break;
      case 'invalid-email':
        showSnackBar(context: context, message: 'Wrong Email provided.');
        break;
      default:
        showSnackBar(
            context: context, message: 'FirebaseAuth error: ${error.message}.');
    }
  } else {
    showSnackBar(
      context: context,
      message: 'General error: $error',
    );
  }
}
