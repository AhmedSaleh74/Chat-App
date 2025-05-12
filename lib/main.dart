import 'package:chat_app/feature/authentiaction/blocs/auth_bloc.dart';
import 'package:chat_app/feature/chat_screen/presentation/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'feature/authentiaction/login_screen/presentation/screens/login_screen.dart';
import 'feature/authentiaction/register_screen/presentation/screens/register_screen.dart';
import 'feature/chat_screen/cubits/chat_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: GetMaterialApp(
        initialRoute: '/LoginScreen',
        getPages: [
          GetPage(name: '/LoginScreen', page: () => LoginScreen()),
          GetPage(name: '/ChatScreen', page: () => ChatScreen()),
          GetPage(
            name: '/RegisterScreen',
            page: () => RegisterScreen(),
          ),
        ],
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
