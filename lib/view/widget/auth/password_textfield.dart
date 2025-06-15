// password_text_field.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/password_controller.dart';
import 'package:myshop/core/constant/app_colors.dart';
import '../custom_textfield.dart';


class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? label;
  final visibilityController;

  PasswordTextField({
    Key? key,
    required this.visibilityController,
    required this.controller,
    this.label = "Password",
  }) : super(key: key);

 // final visibilityController = Get.put(PasswordController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomTextField(
          controller: controller,
          label: label,
          preicon: Icon(Icons.lock_outline,color: Colors.black,),
          obscureText: visibilityController.isObscure.value,
          suficon: IconButton(
            icon: Icon(
              visibilityController.isObscure.value
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: Colors.black,
            ),
            onPressed: () => visibilityController.toggle(),
          ),
        ));
  }
}
