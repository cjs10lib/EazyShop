
import 'package:meta/meta.dart';

abstract class CategoriesEvent {}

class FetchCategories extends CategoriesEvent {}

class DeleteCategory extends CategoriesEvent {
  final String categoryId;

  DeleteCategory({@required this.categoryId});
}