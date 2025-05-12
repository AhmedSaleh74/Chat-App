import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  // Future<void> userLogin(
  //     {required final TextEditingController emailController,
  //     required final TextEditingController passController}) async {
  //   emit(LoginLoading());
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: emailController.text.trim().toLowerCase(),
  //         password: passController.text.trim());
  //     emit(LoginSuccess());
  //   } on FirebaseAuthException catch (e) {
  //     switch (e.code) {
  //       case 'weak-password':
  //         emit(LoginFailure(errorMessage: 'The password is too weak.'));
  //         break;
  //       case 'email-already-in-use':
  //         emit(LoginFailure(errorMessage: 'This email is already in use.'));
  //         break;
  //       case 'user-not-found':
  //         emit(LoginFailure(errorMessage: 'No user found with this email.'));
  //         break;
  //       case 'wrong-password':
  //         emit(LoginFailure(errorMessage: 'Incorrect password.'));
  //         break;
  //       case 'invalid-email':
  //         emit(LoginFailure(errorMessage: 'The email address is invalid.'));
  //         break;
  //       case 'user-disabled':
  //         emit(LoginFailure(
  //             errorMessage: 'This user account has been disabled.'));
  //         break;
  //       case 'operation-not-allowed':
  //         emit(LoginFailure(
  //             errorMessage: 'Email/password sign-in is not enabled.'));
  //         break;
  //       case 'network-request-failed':
  //         emit(LoginFailure(
  //             errorMessage: 'Network error. Please check your connection.'));
  //         break;
  //       case 'too-many-requests':
  //         emit(LoginFailure(
  //             errorMessage: 'Too many attempts. Please try again later.'));
  //         break;
  //       case 'requires-recent-login':
  //         emit(LoginFailure(
  //             errorMessage: 'Please log in again to complete this action.'));
  //         break;
  //       default:
  //         emit(LoginFailure(
  //             errorMessage: 'An unexpected error occurred: ${e.message}'));
  //     }
  //   }
  // }
  //
  // void togglePasswordVisibility() {
  //   if (state is LoginFormState) {
  //     final currentState = state as LoginFormState;
  //     emit(currentState.copyWith(
  //         isPasswordVisible: !currentState.isPasswordVisible));
  //   } else {
  //     emit(LoginFormState(
  //         isPasswordVisible: true)); // fallback if not in form state
  //   }
  // }
  //
  // Future<void> userRegister(
  //     {required final TextEditingController emailController,
  //     required final TextEditingController passController}) async {
  //   emit(RegisterLoading());
  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: emailController.text.trim().toLowerCase(),
  //         password: passController.text.trim());
  //     emit(RegisterSuccess());
  //   } on FirebaseAuthException catch (e) {
  //     switch (e.code) {
  //       case 'weak-password':
  //         emit(RegisterFailure(errorMessage: 'The password is too weak.'));
  //         break;
  //       case 'email-already-in-use':
  //         emit(RegisterFailure(errorMessage: 'This email is already in use.'));
  //         break;
  //       case 'user-not-found':
  //         emit(RegisterFailure(errorMessage: 'No user found with this email.'));
  //         break;
  //       case 'wrong-password':
  //         emit(RegisterFailure(errorMessage: 'Incorrect password.'));
  //         break;
  //       case 'invalid-email':
  //         emit(RegisterFailure(errorMessage: 'The email address is invalid.'));
  //         break;
  //       case 'user-disabled':
  //         emit(RegisterFailure(
  //             errorMessage: 'This user account has been disabled.'));
  //         break;
  //       case 'operation-not-allowed':
  //         emit(RegisterFailure(
  //             errorMessage: 'Email/password sign-in is not enabled.'));
  //         break;
  //       case 'network-request-failed':
  //         emit(RegisterFailure(
  //             errorMessage: 'Network error. Please check your connection.'));
  //         break;
  //       case 'too-many-requests':
  //         emit(RegisterFailure(
  //             errorMessage: 'Too many attempts. Please try again later.'));
  //         break;
  //       case 'requires-recent-Register':
  //         emit(RegisterFailure(
  //             errorMessage: 'Please log in again to complete this action.'));
  //         break;
  //       default:
  //         emit(RegisterFailure(
  //             errorMessage: 'An unexpected error occurred: ${e.message}'));
  //     }
  //   }
  // }
  //
  // void regTogglePasswordVisibility() {
  //   if (state is RegisterFormState) {
  //     final currentState = state as RegisterFormState;
  //     emit(currentState.copyWith(
  //         isPasswordVisible: !currentState.isPasswordVisible));
  //   } else {
  //     emit(RegisterFormState(isPasswordVisible: true));
  //   }
  // }
}
