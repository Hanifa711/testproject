import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/home/mybag_controller.dart';
import 'package:myshop/view/widget/mybag/AddMoreProductsButton.dart';
import 'package:myshop/view/widget/mybag/DeliveryLocationSection.dart';
import 'package:myshop/view/widget/mybag/date_time_picker_widget.dart';
import 'package:myshop/view/widget/mybag/checkout_total_section.dart';
import 'package:myshop/view/widget/mybag/payment_selector.dart';
import 'package:myshop/view/widget/mybag/products_list_section.dart';

class MyBag extends StatelessWidget {
  const MyBag({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MyBagController());
    return Scaffold(
      appBar: AppBar(
        title: Text("My Bag", style: TextStyle(fontWeight: FontWeight.bold)),
        titleSpacing: 25,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: GetBuilder<MyBagController>(
        builder:
            (controller) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Products",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ProductsListSection(
                      cartProducts: controller.cartProducts,
                      onDelete: controller.removeProduct,
                      onDecrement: controller.decrementProduct,
                      onIncrement: controller.incrementProduct,
                    ),
                    const SizedBox(height: 8),
                    AddMoreProductsButton(),
                    const SizedBox(height: 10),
                    Divider(thickness: 1, color: Colors.grey[200]),
                    const SizedBox(height: 10),
                    Text(
                      "Expected Date & Time",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DateAndTimePickerWidget(),
                    const SizedBox(height: 16),
                    Divider(thickness: 1, color: Colors.grey[200]),
                    const SizedBox(height: 8),
                    DeliveryLocationSection(),
                    const SizedBox(height: 10),
                    Divider(thickness: 1, color: Colors.grey[200]),
                    const SizedBox(height: 8),
                    CheckoutTotalSection(),
                    const SizedBox(height: 20),
                    Text(
                      "Payment Method",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    PaymentSelector(),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff5EC401),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          "Place Order",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
