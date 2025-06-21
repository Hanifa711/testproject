import 'package:get/get.dart';
import 'package:myshop/controller/home/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductController());
  }
}
