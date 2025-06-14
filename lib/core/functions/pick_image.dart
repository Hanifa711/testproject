import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myshop/controller/image_controller.dart';

void pickImageView(){
    final ImageController controller = Get.put(ImageController());
       Get.bottomSheet(
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Camera'),
                  onTap: () {
                    controller.pickImage(ImageSource.camera);
                    Get.back();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Gallery'),
                  onTap: () {
                    controller.pickImage(ImageSource.gallery);
                    Get.back();
                  },
                ),
              ],
            ),
            backgroundColor: Colors.white,
          );
         
      
}