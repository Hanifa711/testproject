import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/home/homescreen_controller.dart';
import 'package:myshop/view/widget/home/custombottomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return Scaffold(
      
      body: GetBuilder<HomeScreenControllerImp>(
        builder:
            (controller) => Scaffold(
              bottomNavigationBar: CustomBottomAppBarHome(),
              body: PopScope(
                child: controller.listPage.elementAt(controller.currentpage),
              ),
            ),
      ),
    );
  }
}
