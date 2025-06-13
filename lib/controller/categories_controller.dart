// lib/controller/category_controller.dart
import 'package:get/get.dart';
import 'package:myshop/data/datasource/categories_data.dart';

import 'package:myshop/data/model/category_model.dart';

class CategoryController extends GetxController {
  List<CategoriesModel> categories = [];

  @override
  void onInit() {
    categories = categoriesData;
    super.onInit();
  }
}
