import 'package:get/get.dart';
import 'package:myshop/controller/home/mybag_controller.dart';

class ProductDetailsController extends GetxController {
  late Map<String, dynamic> product;
  late List<Map<String, dynamic>> allProducts;
  int selectedImageIndex = 0;

  List<String> images = [];
  List<Map<String, dynamic>> suggestedProducts = [];

  @override
  void onInit() {
    final args = Get.arguments;
    if (args is Map<String, dynamic>) {
      product = Map<String, dynamic>.from(args['product'] ?? {});
      allProducts =
          (args['allProducts'] as List?)
              ?.map<Map<String, dynamic>>((p) => Map<String, dynamic>.from(p))
              .toList() ??
          [];
    } else {
      product = {};
      allProducts = [];
    }
    images = _extractImages();
    suggestedProducts = _extractSuggestedProducts();
    super.onInit();
  }

  List<String> _extractImages() {
    List<String> imgs = [];
    if (product['selected_images'] != null &&
        product['selected_images']['front'] != null &&
        product['selected_images']['front']['display'] != null &&
        product['selected_images']['front']['display']['en'] != null) {
      imgs.add(product['selected_images']['front']['display']['en']);
    } else if (product['image_front_url'] != null) {
      imgs.add(product['image_front_url']);
    }
    if (imgs.length == 1) imgs = List.filled(2, imgs.first);
    return imgs;
  }

  List<Map<String, dynamic>> _extractSuggestedProducts() {
    return allProducts
        .where((p) => p['product_name'] != product['product_name'])
        .take(2)
        .map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e))
        .toList();
  }

  void changeImage(int idx) {
    selectedImageIndex = idx;
    update();
  }

  void addToBag() {
    Get.find<MyBagController>().addProduct(product);
    Get.snackbar(
      "Added to Bag",
      "${product['product_name'] ?? product['name'] ?? 'Product'} added successfully!",
      backgroundColor: Get.theme.primaryColorLight,
    );
  }
}
