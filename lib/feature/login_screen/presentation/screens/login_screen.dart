import 'package:chat_app/core/utils/snackbar_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/utils/auth_error_handler.dart';
import '../../../../core/utils/auth_validators.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  bool isLoading = false;
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              spacing: 16,
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/school.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
                Text(
                  'Scholar Chat',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 36,
                ),
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                ),
                CustomTextField(
                  hintText: 'Email',
                  controller: emailController,
                ),
                CustomTextField(
                  hintText: 'Password',
                  controller: passController,
                  obscureTxt: isSecure,
                  textFieldSuffixIcon:
                      isSecure ? Icons.visibility_off : Icons.visibility,
                  suffixIconColor: Colors.white,
                  onPressSuffixIcon: () {
                    isSecure = !isSecure;
                    setState(() {});
                  },
                ),
                CustomButton(
                  buttonText: 'Login',
                  onPressed: () async {
                    final validationMessage = validateEmailAndPassword(
                        emailController.text, passController.text);
                    if (validationMessage != 'valid') {
                      showSnackBar(
                          context: context, message: validationMessage);
                      return;
                    }
                    isLoading = true;
                    setState(() {});
                    try {
                      await userLogin(context);
                      Get.offAllNamed('/ChatScreen',
                          arguments: emailController.text);
                    } catch (e) {
                      handleAuthError(context, e);
                    } finally {
                      isLoading = false;
                      setState(() {});
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don't have an account?",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.toNamed('/RegisterScreen');
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Color(0xffC7EDE6),
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> userLogin(BuildContext context) async {
    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passController.text);
    if (userCredential.user != null) {
      showSnackBar(
        context: context,
        message: 'Login successful. User ID: ${userCredential.user?.uid}',
      );
    }
  }
}
