class Product {
  String title;
  String description;
  String imageUrl;
  String category;

  Product(
      {required this.title,
      required this.description,
      required this.imageUrl,
      required this.category});
}

class Category {
  String imageUrl;
  String type;

  Category({required this.imageUrl, required this.type});
}
