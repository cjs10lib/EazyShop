import 'package:meta/meta.dart';

class Category {
  final String categoryId;
  final String title;
  final String description;
  final String imageUrl;
  final DateTime created;
  final DateTime lastUpdate;

  Category(
      {@required this.categoryId,
      @required this.title,
      @required this.description,
      @required this.imageUrl,
      @required this.created,
      @required this.lastUpdate});
}
