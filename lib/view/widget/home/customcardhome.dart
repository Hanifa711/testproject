import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/core/constant/app_colors.dart';
import 'package:myshop/data/model/category_model.dart';

class CustomCardHome extends StatelessWidget {
  final List<CategoriesModel> categories;

  const CustomCardHome({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1,
      ),
      itemBuilder: (context, index) {
        final category = categories[index];
        return GestureDetector(
          onTap: () {
            Get.toNamed(
              "/products",
              arguments: {"id": category.id, "name": category.name},
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: MyColors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(category.image, height: 60),
                const SizedBox(height: 10),
                Text(category.name),
              ],
            ),
          ),
        );
      },
    );
  }
}
