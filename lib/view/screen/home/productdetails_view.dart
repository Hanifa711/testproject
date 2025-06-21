import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:myshop/controller/home/productdetails_controller.dart';
import 'package:myshop/view/widget/product_details/add_button.dart';
import 'package:myshop/view/widget/product_details/product_image_gallery.dart';
import 'package:myshop/view/widget/product_details/suggested_product_card.dart';
import 'package:myshop/view/widget/product_details/wight_And_price.dart';

class ProductDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsController());
    return GetBuilder<ProductDetailsController>(
      builder: (controller) {
        final product = controller.product;
        final images = controller.images;
        final suggestedProducts = controller.suggestedProducts;
        double price = double.tryParse('${product['price'] ?? 182}') ?? 182;

        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Product Details",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black87,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductImageGallery(
                    images: images,
                    selectedImageIndex: controller.selectedImageIndex,
                    onImageTap: controller.changeImage,
                  ),
                  const SizedBox(height: 16),

                  Text(
                    product['product_name'] ?? 'Product Name',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  // الوزن والسعر
                  WeightAndPriceRow(weight: product['quantity'], price: price),
                  const SizedBox(height: 16),
                  // التصنيف
                  Row(
                    children: [
                      Icon(Icons.category, size: 18, color: Colors.grey[700]),
                      const SizedBox(width: 7),
                      Expanded(
                        child: Text(
                          product['categories'] is String
                              ? product['categories']
                              : (product['categories_tags'] as List?)?.join(
                                    ', ',
                                  ) ??
                                  '',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[700],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // الوصف
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.description,
                        size: 18,
                        color: Colors.grey[700],
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        child: Text(
                          product['ingredients_text'] ?? 'No description.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  Text(
                    "You can also check these items",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children:
                        suggestedProducts.map((prod) {
                          return SuggestedProductCard(product: prod);
                        }).toList(),
                  ),
                  const SizedBox(height: 14),
                  AddToBagButton(onPressed: controller.addToBag),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
