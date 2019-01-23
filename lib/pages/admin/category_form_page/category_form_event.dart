import 'dart:io';

import 'package:meta/meta.dart';

abstract class CategoryFormEvent {}

class CreateCategory extends CategoryFormEvent {
  final String title;
  final String description;
  final File image;

  CreateCategory({@required this.title, @required this.description, @required this.image});
}

class CreatedCategory extends CategoryFormEvent {}
