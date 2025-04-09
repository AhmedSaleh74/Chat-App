import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/LoginScreen',
      getPages: [
        GetPage(name: '/LoginScreen', page: () => LoginScreen()),
        GetPage(
          name: '/RegisterScreen',
          page: () => RegisterScreen(),
          transition: Transition.leftToRightWithFade,
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
