import 'dart:io';

import 'package:meta/meta.dart';

abstract class AdminProductFormEvent {}

class CreateProduct extends AdminProductFormEvent {
  final File image;
  final String designer;
  final String categoryId;
  final String categoryName;
  final String components;
  final String title;
  final String description;
  final double price;
  final List<String> sizes;
  final List<String> colors;
  final int quantity;

  CreateProduct(
      {@required this.image,
      @required this.designer,
      @required this.categoryId,
      @required this.categoryName,
      @required this.components,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.sizes,
      @required this.colors,
      @required this.quantity});
}

class CreatedProduct extends AdminProductFormEvent {}

class UpdateProduct extends AdminProductFormEvent {
  final String productId;
  final File image;
  final String designer;
  final String categoryId;
  final String categoryName;
  final String components;
  final String title;
  final String description;
  final double price;
  final List<String> sizes;
  final List<String> colors;
  final int quantity;

  UpdateProduct(
      {@required this.productId,
      @required this.image,
      @required this.designer,
      @required this.categoryId,
      @required this.categoryName,
      @required this.components,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.sizes,
      @required this.colors,
      @required this.quantity});
}
