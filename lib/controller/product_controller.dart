import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../data/model/product_model.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('https://dummyjson.com/products'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final productList = (data['products'] as List)
            .map((json) => Product.fromJson(json))
            .toList();
        products.assignAll(productList);
      } else {
        Get.snackbar('Error', 'Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
