import 'package:chat_app/core/utils/snackbar_util.dart';
import 'package:chat_app/core/utils/auth_validators.dart';
import 'package:chat_app/feature/authentiaction/blocs/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/theming/colors.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          isLoading = false;
          Get.toNamed('/LoginScreen', arguments: emailController.text);
        } else if (state is RegisterFailure) {
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
                      buttonText: 'Register',
                      onPressed: () async {
                        final validationMessage = validateEmailAndPassword(
                            emailController.text, passController.text);
                        if (validationMessage != 'valid') {
                          showSnackBar(
                              context: context, message: validationMessage);
                          return;
                        }
                        BlocProvider.of<AuthBloc>(context).add(RegisterEvent(
                            emailController: emailController,
                            passController: passController));
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
          ),
        );
      },
    );
  }
}
