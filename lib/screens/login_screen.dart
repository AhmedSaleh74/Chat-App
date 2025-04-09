import 'package:chat_app/screens/register_screen.dart';
import 'package:chat_app/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2B475E),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            Spacer(
              flex: 1,
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
            Spacer(
              flex: 2,
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
            CustomTextField(hintText: 'Email'),
            CustomTextField(hintText: 'Password'),
            SizedBox(
              width: Get.height,
              child: CustomButton(buttonText: 'Login'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "don't have an account",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => RegisterScreen());
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Color(0xffC7EDE6),
                      ),
                    ))
              ],
            ),
            Spacer(
              flex: 2,
            )
          ],
        ),
      ),
    );
  }
}
