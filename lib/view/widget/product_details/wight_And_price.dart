import 'package:flutter/material.dart';

class WeightAndPriceRow extends StatelessWidget {
  final String? weight;
  final double price;

  const WeightAndPriceRow({super.key, this.weight, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          weight ?? '',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Text(
          '₹${price.toInt()}',
          style: TextStyle(
            fontSize: 19,
            color: Color(0xff5EC401),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
