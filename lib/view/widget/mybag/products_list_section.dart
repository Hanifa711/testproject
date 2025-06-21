import 'package:flutter/material.dart';
import 'package:myshop/view/widget/mybag/product_item_tile.dart';

class ProductsListSection extends StatelessWidget {
  final List<Map<String, dynamic>> cartProducts;
  final void Function(Map<String, dynamic>) onDelete, onDecrement, onIncrement;

  const ProductsListSection({
    super.key,
    required this.cartProducts,
    required this.onDelete,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          cartProducts
              .map(
                (prod) => ProductItemTile(
                  prod: prod,
                  onDelete: () => onDelete(prod),
                  onDecrement: () => onDecrement(prod),
                  onIncrement: () => onIncrement(prod),
                ),
              )
              .toList(),
    );
  }
}
