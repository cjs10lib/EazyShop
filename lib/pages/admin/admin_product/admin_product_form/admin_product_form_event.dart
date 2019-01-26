import 'package:meta/meta.dart';

abstract class AdminProductFormEvent {}

class CreateProduct extends AdminProductFormEvent {
  final String designer;
  final String category;
  final String components;
  final String title;
  final String description;
  final double price;
  final List<String> sizes;
  final List<String> colors;
  final int quantity;

  CreateProduct(
      {@required this.designer,
      @required this.category,
      @required this.components,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.sizes,
      @required this.colors,
      @required this.quantity});
}

class CreatedProduct extends AdminProductFormEvent {}
