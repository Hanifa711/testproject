import 'package:flutter/material.dart';

class SuggestedProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  const SuggestedProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double price = double.tryParse('${product['price'] ?? 120}') ?? 120;
    double oldPrice = price + 15;
    return Container(
      width: 376,
      height: 135,
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 7, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 115,
            height: 121,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child:
                product['image_front_url'] != null
                    ? Image.network(
                      product['image_front_url'],
                      width: 60,
                      height: 60,
                      fit: BoxFit.contain,
                    )
                    : Icon(Icons.image, size: 45),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['product_name'] ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    if (oldPrice != price)
                      Text(
                        '₹${oldPrice.toInt()}',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    if (oldPrice != price) SizedBox(width: 7),
                    Text(
                      '₹${price.toInt()}',
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
