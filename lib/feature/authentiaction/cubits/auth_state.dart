part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

// final class LoginSuccess extends AuthState {}
//
// final class LoginLoading extends AuthState {}
//
// final class LoginFailure extends AuthState {
//   final String errorMessage;
//   LoginFailure({required this.errorMessage});
// }
//
// final class LoginFormState extends AuthState {
//   final bool isPasswordVisible;
//
//   LoginFormState({this.isPasswordVisible = false});
//
//   LoginFormState copyWith({bool? isPasswordVisible}) {
//     return LoginFormState(
//       isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
//     );
//   }
// }

final class RegisterSuccess extends AuthState {}

final class RegisterLoading extends AuthState {}

final class RegisterFailure extends AuthState {
  final String errorMessage;
  RegisterFailure({required this.errorMessage});
}

final class RegisterFormState extends AuthState {
  final bool isPasswordVisible;

  RegisterFormState({this.isPasswordVisible = false});

  RegisterFormState copyWith({bool? isPasswordVisible}) {
    return RegisterFormState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }
}
