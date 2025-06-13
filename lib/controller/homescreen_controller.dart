import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myshop/view/screen/home/category.dart';
import 'package:myshop/view/screen/home/homepage.dart';
import 'package:myshop/view/screen/home/more.dart';
import 'package:myshop/view/screen/home/mybag.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [HomePage(), Category(), MyBag(), More()];

  List buttonappbar = [
    {"title": "HomePage", "icon": Icons.home_outlined},
    {"title": "Category", "icon": Icons.grid_view},
    {"title": "MyBag", "icon": Icons.shopping_bag_outlined},
    {"title": "More", "icon": Icons.menu},
  ];
  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
