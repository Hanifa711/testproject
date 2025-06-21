import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/home/product_controller.dart';
import 'package:myshop/controller/home/mybag_controller.dart';
import 'package:myshop/core/class/statusrequest.dart';
import 'package:myshop/routes/app_routes.dart';
import 'package:myshop/view/widget/products/product_grid_item.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    final String categoryName =
        (Get.arguments is Map && Get.arguments['name'] != null)
            ? Get.arguments['name']
            : (Get.arguments ?? '');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: GetBuilder<ProductController>(
        builder: (controller) {
          if (controller.status == StatusRequest.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.status != StatusRequest.success) {
            return const Center(child: Text("Error loading products"));
          }
          if (controller.products.isEmpty) {
            return const Center(child: Text("No products found!"));
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: controller.products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                final product = controller.products[index];
                return ProductGridItem(
                  product: product,
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.productdetails,
                      arguments: {
                        'product': product,
                        'allProducts': controller.products,
                      },
                    );
                  },
                  onAddToBag: () {
                    Get.find<MyBagController>().addProduct(product);
                    Get.snackbar(
                      "Added to Bag",
                      "${product['product_name'] ?? product['name'] ?? 'Product'} added successfully!",
                      backgroundColor: Colors.green[100],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
