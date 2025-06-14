import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/homescreen_controller.dart';
import 'package:myshop/view/widget/home/custombuttonappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder:
          (controller) => Container(
            height: 116,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  offset: Offset(0, -1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                  controller.listPage.length,
                  (index) => CustomButtonAppBar(
                    textbutton: controller.buttonappbar[index]["title"],
                    icondata: controller.buttonappbar[index]["icon"],
                    active: controller.currentpage == index,
                    onPressed: () {
                      controller.changePage(index);
                    },
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
