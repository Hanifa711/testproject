import 'package:flutter/material.dart';

class ProductGridItem extends StatelessWidget {
  final Map product;
  final VoidCallback onTap;
  final VoidCallback onAddToBag;

  const ProductGridItem({
    super.key,
    required this.product,
    required this.onTap,
    required this.onAddToBag,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 100,
              width: 110,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child:
                  (product['image_front_url'] != null &&
                          product['image_front_url'] != '')
                      ? Image.network(
                        product['image_front_url'],
                        fit: BoxFit.contain,
                      )
                      : Icon(
                        Icons.image_not_supported,
                        size: 50,
                        color: Colors.grey,
                      ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              product['product_name'] ?? product['name'] ?? 'No Name',
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Text(
                  '₹${product['price'] ?? 99}',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.orange,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SizedBox(
              height: 34,
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: onAddToBag,
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  size: 16,
                  color: Colors.white,
                ),
                label: const Text(
                  'Add To Bag',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5EC401),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
