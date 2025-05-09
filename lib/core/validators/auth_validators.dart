class AuthValidators {
  static String validateEmailAndPassword(String email, String password) {
    if (email.isEmpty || password.isEmpty) {
      return 'Email or Password is empty. Please complete the data.';
    }
    if (!email.contains('@') || password.length < 8) {
      return 'Email or password is not valid.';
    }
    return 'valid'; // valid
  }
}
