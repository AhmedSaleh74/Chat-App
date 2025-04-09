import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.buttonText});
  final String buttonText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height / 16,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(buttonText),
      ),
    );
  }
}
