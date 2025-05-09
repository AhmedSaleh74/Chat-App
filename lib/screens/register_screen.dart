import 'package:chat_app/constant.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            CustomTextField(hintText: 'Email'),
            CustomTextField(hintText: 'Password'),
            CustomButton(buttonText: 'Register'),
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
    );
  }
}
