import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myshop/view/screen/auth/splash_phone_login.dart';

class ImageController extends GetxController {
  var pickedImage = Rxn<File>();

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(source: source);
      if (image != null) {
        debugPrint("Image saved");
        userModel.image=image.path;
        pickedImage.value=File(image.path);
      }
    } catch (e) {
      debugPrint("Image picking error: $e");
    }
  }
}
