class Product {
  Product({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.availableQuantity,
  });

  final String id;
  final String imageUrl;
  final String title;
  final double price;
  final int availableQuantity;

  // serialization code
  // factory Product.fromJson(Map<String, dynamic> json) {
  // }
  //
  // Map<String, dynamic> toJson() =>
}