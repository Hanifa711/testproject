import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/categories_controller.dart';
import 'package:myshop/view/widget/home/customcardhome.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());
    return Scaffold(
      appBar: AppBar(
        
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: const Text(
            "Category",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GetBuilder<CategoryController>(
          builder: (controller) {
            if (controller.categories.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return CustomCardHome(categories: controller.categories);
            }
          },
        ),
      ),
    );
  }
}
