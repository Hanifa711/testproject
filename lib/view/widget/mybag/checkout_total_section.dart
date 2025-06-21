import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/home/mybag_controller.dart';

class CheckoutTotalSection extends StatelessWidget {
  const CheckoutTotalSection({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyBagController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(child: Text("Subtotal", style: TextStyle(fontSize: 15))),
            Text(
              "BDT${controller.subtotal}",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Expanded(
              child: Text("Delivery Charge", style: TextStyle(fontSize: 15)),
            ),
            Text(
              "BDT${controller.deliveryCharge}",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Divider(height: 24, color: Colors.grey[300]),
        Row(
          children: [
            Expanded(
              child: Text(
                "Total",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "BDT${controller.total}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
