import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'category_grid_item.dart';

class CategoriesGrid extends StatelessWidget {
  final List<String> categories;
  final List<String> images;
  final void Function(int) onCategoryTap;

  const CategoriesGrid({
    super.key,
    required this.categories,
    required this.images,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (context, index) {
        return CategoryGridItem(
          title: categories[index].capitalize ?? '',
          imagePath: images[index % images.length],
          onTap: () => onCategoryTap(index),
        );
      },
      shrinkWrap: true,
     physics: NeverScrollableScrollPhysics(),
    );
  }
}
