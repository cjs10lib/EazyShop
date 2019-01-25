import 'dart:io';

import 'package:meta/meta.dart';

abstract class CategoryFormEvent {}

class CreateCategory extends CategoryFormEvent {
  final String title;
  final String description;
  final File image;

  CreateCategory(
      {@required this.title, @required this.description, @required this.image});
}

class UpdateCategory extends CategoryFormEvent {
  final String categoryId;
  final String title;
  final String description;
  final File image;

  UpdateCategory(
      {@required this.categoryId,
      @required this.title,
      @required this.description,
      @required this.image});
}

class CreatedCategory extends CategoryFormEvent {}
