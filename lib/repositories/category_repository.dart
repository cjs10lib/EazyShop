import 'dart:async';
import 'package:meta/meta.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eazy_shop/services/category_service.dart';

class CategoryRepository {
  final _categoryService = CategoryService();

  Future<void> createCategory(
      {@required String categoryId,
      @required String title,
      @required String description,
      @required String imageUrl}) async {
    try {
      return await _categoryService.createCategory(
        categoryId: categoryId,
        title: title,
        description: description,
        imageUrl: imageUrl,
      );
    } catch (error) {
      throw (error.toString());
    }
  }
}
