import 'package:chat_app/core/utils/snackbar_util.dart';
import 'package:chat_app/feature/authentiaction/blocs/auth_bloc.dart';
import 'package:chat_app/feature/chat_screen/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../core/theming/colors.dart';
import '../../../../../core/utils/auth_validators.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passController = TextEditingController();

  bool isLoading = false;
  bool isVisiblePass = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          isLoading = false;
          Get.toNamed('/ChatScreen', arguments: emailController.text);
          BlocProvider.of<ChatBloc>(context).add(ReceiveMessageEvent());
        } else if (state is LoginFailure) {
          showSnackBar(context: context, message: state.errorMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
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
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        final isVisiblePass =
                            state is AuthFormState && state.isPasswordVisible;

                        return CustomTextField(
                          hintText: 'Password',
                          controller: passController,
                          obscureTxt: !isVisiblePass,
                          textFieldSuffixIcon: isVisiblePass
                              ? Icons.visibility_off
                              : Icons.visibility,
                          suffixIconColor: Colors.white,
                          onPressSuffixIcon: () {
                            BlocProvider.of<AuthBloc>(context)
                                .add(TogglePasswordVisibilityEvent());
                          },
                        );
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
                        BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                            emailController: emailController,
                            passController: passController));
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
      },
    );
  }
}
