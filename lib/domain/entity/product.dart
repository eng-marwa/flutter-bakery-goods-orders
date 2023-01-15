import '../../data/model/Bakery.dart';

class Product {
  Product({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.steps,
    required this.servings,
    required this.image,
  });

  int? id;
  String? name;
  List<Ingredients>? ingredients;
  List<Steps>? steps;
  int? servings;
  String? image;


}