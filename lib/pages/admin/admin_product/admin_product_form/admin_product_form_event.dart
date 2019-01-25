import 'package:meta/meta.dart';

abstract class AdminProductFormEvent {}

class CreateProduct extends AdminProductFormEvent {
  final String designer;
  final String category;
  final String components;
  final String title;
  final String description;
  final double price;
  final int quantity;

  CreateProduct(
      {@required this.designer,
      @required this.category,
      @required this.components,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.quantity});
}

class CreatedProduct extends AdminProductFormEvent {}
