import 'package:chat_app/feature/login_screen/presentation/screens/login_screen.dart';
import 'package:chat_app/feature/register_screen/presentation/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
