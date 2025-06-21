import 'package:get/get.dart';
import 'package:myshop/core/class/crud.dart';
import 'package:myshop/core/class/statusrequest.dart';
import 'package:myshop/linkapi.dart';

class ProductController extends GetxController {
  Crud crud = Crud();

  List products = [];
  StatusRequest status = StatusRequest.none;
  late String category;

  @override
  void onInit() {
    super.onInit();
    var arg = Get.arguments;
    if (arg is String) {
      category = arg;
    } else if (arg is Map && arg['name'] != null) {
      category = arg['name'];
    } else {
      category = "";
    }
    fetchProducts();
  }

  void fetchProducts() async {
    status = StatusRequest.loading;
    update();

    var response = await crud.getData(
      AppLink.productsByCategory(category, pageSize: 20),
    );
    response.fold(
      (failure) {
        status = failure;
        products = [];
      },
      (data) {
        status = StatusRequest.success;
        products = data;
      },
    );

    update();
  }
}
