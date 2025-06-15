import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/product_controller.dart';

class ProductView extends StatelessWidget {
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];
            return ListTile(
              title: Text(product.name),
              subtitle: Text('${product.price.toStringAsFixed(2)} \$'),
            );
          },
        );
      }),
    );
  }
}
