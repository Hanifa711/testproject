import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/core/constant/app_colors.dart';
import 'package:myshop/routes/app_routes.dart';

class AddMoreProductsButton extends StatelessWidget {
  const AddMoreProductsButton({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: () => Get.toNamed(AppRoutes.category),
        icon: Icon(Icons.add, color: MyColors.white, size: 22),
        label: Text(
          "Add More Products",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: MyColors.green,
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
