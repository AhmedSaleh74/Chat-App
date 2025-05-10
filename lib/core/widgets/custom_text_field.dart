import 'package:flutter/material.dart';

import '../theming/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.controller,
      this.borderColor,
      this.textFieldSuffixIcon,
      this.onPressSuffixIcon,
      this.onSubmitted,
      this.obscureTxt = false,
      this.suffixIconColor});
  final String hintText;
  final TextEditingController? controller;
  final Color? borderColor;
  final Color? suffixIconColor;
  final bool obscureTxt;
  final IconData? textFieldSuffixIcon;
  final VoidCallback? onPressSuffixIcon;
  final Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureTxt,
      controller: controller,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: borderColor ?? Colors.white,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: borderColor ?? Colors.white,
          ),
        ),
        label: Text(
          hintText,
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
        suffixIcon: IconButton(
          onPressed: onPressSuffixIcon,
          icon: Icon(
            textFieldSuffixIcon,
            color: suffixIconColor ?? kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
