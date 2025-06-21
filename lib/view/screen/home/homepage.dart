import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/home/home_controller.dart';
import 'package:myshop/view/widget/home/LocationSection.dart';
import 'package:myshop/view/widget/home/SearchBarWidget.dart';
import 'package:myshop/view/widget/category/categories_grid.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            iconSize: 25,
            padding: EdgeInsets.all(20),
            onPressed: () {},
            icon: Icon(Icons.notifications_none_rounded),
          ),
        ],
        titleSpacing: 25,
        title: Text(
          "Geocery Plus",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LocationSection(address: "32 Llanberis Close, Tonteg, CF38 1HR"),
            const SizedBox(height: 20),
            SearchBarWidget(onChanged: (val) {}),
            const SizedBox(height: 20),
            GetBuilder<HomeController>(
              builder: (controller) {
                if (controller.categories.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  final firstSix = controller.categories.take(6).toList();
                  final images = firstSix.map((cat) => cat.image).toList();
                  final names = firstSix.map((cat) => cat.name).toList();
                  return CategoriesGrid(
                    categories: names,
                    images: images,
                    onCategoryTap: (index) {
                      Get.toNamed(
                        "/products",
                        arguments: {
                          "id": firstSix[index].id,
                          "name": firstSix[index].name,
                        },
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
