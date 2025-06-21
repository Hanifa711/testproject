class AppLink {
  static const String baseUrl = "https://world.openfoodfacts.org";

  // لائحة الأقسام تجهزها محلياً
  static const List<String> categories = [
    "milk",
    "snacks",
    "cheese",
    "chocolate",
    "rice",
    "juice",
    "bread",
    "yogurt",
    "butter",
    // زيد أي قسم تريده
  ];

  static String productsByCategory(String category, {int pageSize = 20}) =>
      "$baseUrl/cgi/search.pl?search_terms=$category&search_simple=1&action=process&json=1&page_size=$pageSize";
}
