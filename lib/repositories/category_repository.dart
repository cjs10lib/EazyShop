import 'dart:async';
import 'package:meta/meta.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:eazy_shop/services/category_service.dart';

class CategoryRepository {
  final _categoryService = CategoryService();

  Future<String> createCategory(
      {@required String title, @required String description}) async {
    try {
      DocumentReference documentReference = await _categoryService
          .createCategory(title: title, description: description);

      return documentReference.documentID;
      // throw ('rtrtre error');
    } catch (error) {
      print('repo error ${error.toString()}');
      throw (error.toString());
    }
  }
}
