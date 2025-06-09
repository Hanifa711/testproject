class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['title'],
      price: (json['price'] as num).toDouble(),
    );
  }
}
