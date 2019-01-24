import 'dart:async';
import 'package:eazy_shop/models/category.dart';
import 'package:meta/meta.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eazy_shop/services/category_service.dart';

class CategoryRepository {
  final _categoryService = CategoryService();

  Future<List<Category>> fetchCategories() async {
    try {
      QuerySnapshot snapshot = await _categoryService.fetchCategories();
      final List<DocumentSnapshot> _documentsSnap = snapshot.documents;

      List<Category> categories = [];

      _documentsSnap.forEach((DocumentSnapshot document) {
        Map<String, dynamic> categoryData = document.data;

        final category = Category(
          categoryId: document.documentID,
          title: categoryData['title'],
          description: categoryData['description'],
          imageUrl: categoryData['imageUrl'],
          created: categoryData['created'],
          lastUpdate: categoryData['lastUpdate'],
        );

        categories.add(category);
      });

      return categories;
    } catch (error) {
      throw (error.toString());
    }
  }

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

  Future<void> deleteCategory({@required categoryId}) async {
    try {
      return await _categoryService.deleteCategory(categoryId: categoryId);
    } catch (error) {
      throw (error.toString());
    }
  }
}
