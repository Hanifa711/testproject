import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myshop/controller/home/mybag_controller.dart';

class PaymentSelector extends StatelessWidget {
  const PaymentSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyBagController>();
    String displayMethod(PaymentMethod method) {
      switch (method) {
        case PaymentMethod.card:
          return "Credit / Debit Card";
        case PaymentMethod.bkash:
          return "Bkash Online Payment";
        case PaymentMethod.cod:
        default:
          return "Cash on Delivery";
      }
    }

    IconData methodIcon(PaymentMethod method) {
      switch (method) {
        case PaymentMethod.card:
          return Icons.credit_card;
        case PaymentMethod.bkash:
          return Icons.send;
        case PaymentMethod.cod:
        default:
          return Icons.payments;
      }
    }

    return GestureDetector(
      onTap: () {
        Get.toNamed("/payment_method");
      },
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 6, top: 10),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Color(0xffF4FFF1),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xff5EC401), width: 1),
        ),
        child: Row(
          children: [
            Icon(
              methodIcon(controller.paymentMethod),
              color: Color(0xff5EC401),
              size: 30,
            ),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                "Tap Here to select your Payment Method",
                style: TextStyle(
                  color: Color(0xff149b2e),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Color(0xff5EC401)),
          ],
        ),
      ),
    );
  }
}
