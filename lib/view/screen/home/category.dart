import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/home/categories_controller.dart';
import 'package:myshop/routes/app_routes.dart';
import 'package:myshop/view/widget/category/categories_grid.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Category", style: TextStyle(fontWeight: FontWeight.bold)),
        titleSpacing: 25,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: GetBuilder<CategoryController>(
            builder: (controller) {
              final categories = controller.categories;
              final catImages = [
                "assets/categories/fruits.png",
                "assets/categories/breakfast.png",
                "assets/categories/beverages.png",
                "assets/categories/meat.png",
                "assets/categories/snacks.png",
                "assets/categories/dairy.png",
              ];
              return CategoriesGrid(
                categories: categories,
                images: catImages,
                onCategoryTap: (index) {
                  Get.toNamed(AppRoutes.products, arguments: categories[index]);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
