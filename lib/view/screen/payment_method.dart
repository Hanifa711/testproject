import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/home/mybag_controller.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyBagController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Method",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          PaymentMethodTile(
            icon: Icons.credit_card,
            title: "Credit / Debit Card",
            selected: controller.paymentMethod == PaymentMethod.card,
            onTap: () {
              controller.setPaymentMethod(PaymentMethod.card);
              Get.back();
            },
          ),
          PaymentMethodTile(
            icon: Icons.send,
            title: "Bkash Online Payment",
            selected: controller.paymentMethod == PaymentMethod.bkash,
            onTap: () {
              controller.setPaymentMethod(PaymentMethod.bkash);
              Get.back();
            },
          ),
          PaymentMethodTile(
            icon: Icons.payments,
            title: "Cash on Delivery",
            selected: controller.paymentMethod == PaymentMethod.cod,
            onTap: () {
              controller.setPaymentMethod(PaymentMethod.cod);
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}

class PaymentMethodTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.icon,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: selected ? Color(0xff5EC401) : Colors.grey[600],
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
      trailing:
          selected ? Icon(Icons.check_circle, color: Color(0xff5EC401)) : null,
      onTap: onTap,
      selected: selected,
    );
  }
}
