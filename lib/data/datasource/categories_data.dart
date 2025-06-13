import 'package:myshop/core/constant/app_imageasset.dart';
import 'package:myshop/data/model/category_model.dart';

List<CategoriesModel> categoriesData = [
  //=========== Home Page ===========
  CategoriesModel(
    id: 1,
    name: "Fruits & Vegetables",
    image: "assets/avocado.png",
  ),
  CategoriesModel(id: 2, name: "Breakfast", image: "assets/breakfast.png"),
  CategoriesModel(id: 3, name: "Meat & Fish", image: "assets/meat.png"),
  CategoriesModel(id: 4, name: "Beverages", image: "assets/beverages.png"),
  CategoriesModel(id: 5, name: "Snacks", image: "assets/snacks.png"),
  CategoriesModel(id: 6, name: "Dairy", image: "assets/dairy.png"),

  //=========== Categories Page Extra ===========
  CategoriesModel(id: 7, name: "Meat 2", image: AppImageAsset.meat),
  CategoriesModel(id: 8, name: "Dairy 2", image: AppImageAsset.dairy),
  CategoriesModel(id: 9, name: "Fruits", image: AppImageAsset.fruits),
  CategoriesModel(id: 10, name: "Snacks 2", image: AppImageAsset.snacks),
  CategoriesModel(id: 11, name: "Breakfast 2", image: AppImageAsset.breakfast),
  CategoriesModel(id: 12, name: "Beverages 2", image: AppImageAsset.beverages),
];
