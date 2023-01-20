import '../../data/model/product_model.dart';

class Product {
  Product({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.type,
    required this.image,
  });

  int? id;
  String? name;
  List<Ingredients>? ingredients;
  String? type;
  String? image;


}