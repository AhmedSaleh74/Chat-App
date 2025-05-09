import 'package:chat_app/constant.dart';
import 'package:chat_app/core/utils/snackbar_util.dart';
import 'package:chat_app/core/validators/auth_validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ModalProgressHUD(
        inAsyncCall: isLoading.value,
        child: Scaffold(
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.all(16.0),
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
                    'REGISTER',
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
                ),
                CustomButton(
                  buttonText: 'Register',
                  onPressed: () async {
                    final validationMessage =
                        AuthValidators.validateEmailAndPassword(
                            emailController.text, passController.text);
                    if (validationMessage != 'valid') {
                      SnackBarUtil.showSnackBar(
                          context: context, message: validationMessage);
                      return;
                    }
                    isLoading.value = true;
                    try {
                      await userRegister(context);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        SnackBarUtil.showSnackBar(
                            context: context,
                            message: 'The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        SnackBarUtil.showSnackBar(
                            context: context,
                            message:
                                'The account already exists for that email.');
                      } else {
                        SnackBarUtil.showSnackBar(
                            context: context,
                            message: 'FirebaseAuth error: ${e.message}.');
                      }
                    } catch (e) {
                      SnackBarUtil.showSnackBar(
                          context: context, message: 'General error: $e');
                    }
                    isLoading.value = false;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "already have an account!",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'Login',
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
      );
    });
  }

  Future<void> userRegister(BuildContext context) async {
    final UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passController.text);
    SnackBarUtil.showSnackBar(
        context: context, message: 'User Created: ${userCredential.user?.uid}');
  }
}
