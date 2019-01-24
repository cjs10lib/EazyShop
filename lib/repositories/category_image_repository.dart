import 'dart:async';
import 'dart:io';

import 'package:eazy_shop/services/category_image_service.dart';
import 'package:meta/meta.dart';

class CategoryImageRepository {
  final _categoryImageService = CategoryImageService();

  Future<Map<String, dynamic>> createCategoryImage({@required File categoryimage}) async {
    Map<String, dynamic> _categoryImage;

    try {
      _categoryImage = await _categoryImageService.createCategoryImage(
          categoryImage: categoryimage);

      return _categoryImage;
    } catch (error) {
      print('category image upload repo error ${error.toString()}');
      throw (error.toString());
    }
  }

  Future<void> deleteCategoryImage({@required String categoryId}) async {
    try {
      return await _categoryImageService.deleteCategoryImage(categoryId: categoryId);
    } catch (error) {
      throw (error.toString());
    }
  }
}
