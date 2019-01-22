import 'package:meta/meta.dart';

abstract class CategoryFormEvent {}

class CreateCategory extends CategoryFormEvent {
  final String title;
  final String description;

  CreateCategory({@required this.title, @required this.description});
}

class CreatedCategory extends CategoryFormEvent {}
