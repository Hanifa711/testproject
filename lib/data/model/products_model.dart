class ProductModel {
  final int id;
  final String name;
  final String desc;
  final double price;
  final double? oldPrice;
  final String weight;
  final int categoryId;
  final String categoryName;
  final String description;
  final List<String> images;

  ProductModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    this.oldPrice,
    required this.weight,
    required this.categoryName,
    required this.description,
    required this.categoryId,
    required this.images,
  });
}
