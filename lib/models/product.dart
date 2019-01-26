import 'package:meta/meta.dart';

class Product {
  final String productId;
  final String designer;
  final String category;
  final String components;
  final String title;
  final String description;
  final double price;
  final List<dynamic> sizes;
  final List<dynamic> colors;
  final int quantity;
  final imageUrl;
  final DateTime created;
  final DateTime lastUpdate;

  Product(
      {@required this.productId,
      @required this.designer,
      @required this.category,
      @required this.components,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.sizes,
      @required this.colors,
      @required this.quantity,
      @required this.imageUrl,
      @required this.created,
      @required this.lastUpdate});
}
