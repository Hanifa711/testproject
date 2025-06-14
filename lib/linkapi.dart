class AppLink {
  static const String baseUrl = "https://fakestoreapi.com";

  static const String categories = "$baseUrl/products/categories";
  static String productsByCategory(String category) =>
      "$baseUrl/products/category/$category";
}
