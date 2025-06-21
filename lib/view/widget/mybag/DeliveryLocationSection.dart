import 'package:flutter/material.dart';

class DeliveryLocationSection extends StatelessWidget {
  const DeliveryLocationSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Delivery Location",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(height: 6),
        Text(
          "32 Llanberis Close, Tonteg, CF38 1HR",
          style: TextStyle(color: Colors.grey[700], fontSize: 14),
        ),
        SizedBox(height: 4),
        Row(
          children: [
            Text(
              "Delivery Charge: ",
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
            Text("₹50", style: TextStyle(color: Colors.green)),
          ],
        ),
      ],
    );
  }
}
