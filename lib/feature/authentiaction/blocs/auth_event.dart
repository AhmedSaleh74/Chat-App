part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  final TextEditingController emailController;
  final TextEditingController passController;
  LoginEvent({required this.emailController, required this.passController});
}

class TogglePasswordVisibilityEvent extends AuthEvent {}

class RegisterEvent extends AuthEvent {
  final TextEditingController emailController;
  final TextEditingController passController;
  RegisterEvent({required this.emailController, required this.passController});
}
