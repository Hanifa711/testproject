import 'package:flutter/material.dart';

class ProductItemTile extends StatelessWidget {
  final Map<String, dynamic> prod;
  final VoidCallback onDelete, onDecrement, onIncrement;

  const ProductItemTile({
    super.key,
    required this.prod,
    required this.onDelete,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 376,
      height: 135,
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 7, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:
                (prod['image'] != null && prod['image'] != '')
                    ? Image.network(
                      prod['image'],
                      width: 115,
                      height: 121,
                      fit: BoxFit.cover,
                    )
                    : Container(
                      width: 115,
                      height: 121,
                      color: Colors.grey[200],
                      child: Icon(
                        Icons.image_not_supported,
                        color: Colors.grey,
                      ),
                    ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  prod['name'] ?? prod['product_name'] ?? 'Product Name',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 3),
                Text(
                  prod['quantity'] ?? prod['weight'] ?? '',
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "₹${prod['price'] ?? 99}",
                      style: TextStyle(
                        color: Color(0xff5EC401),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "₹${prod['oldPrice'] ?? ''}",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: onDelete,
                icon: Icon(Icons.delete, color: Colors.red),
              ),
              IconButton(
                onPressed: onDecrement,
                icon: Icon(Icons.remove_circle_outline, color: Colors.grey),
              ),
              Text(
                prod['count'].toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              IconButton(
                onPressed: onIncrement,
                icon: Icon(Icons.add_circle_outline, color: Color(0xff5EC401)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
