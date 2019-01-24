import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eazy_shop/models/category.dart';
import 'package:eazy_shop/pages/admin/categories/categories_event.dart';
import 'package:eazy_shop/pages/admin/categories/categories_state.dart';
import 'package:eazy_shop/repositories/category_image_repository.dart';
import 'package:eazy_shop/repositories/category_repository.dart';
import 'package:meta/meta.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final _categoryRepository = CategoryRepository();
  final _categoryImageRepository = CategoryImageRepository();

  @override
  CategoriesState get initialState => CategoriesState.initial();

  void onFetchCategories() {
    dispatch(FetchCategories());
  }

  void onDeleteCategory({@required categoryId}) {
    dispatch(DeleteCategory(categoryId: categoryId));
  }

  @override
  Stream<CategoriesState> mapEventToState(
      CategoriesState currentState, CategoriesEvent event) async* {
    if (event is FetchCategories) {
      yield CategoriesState.initial();

      try {
        List<Category> categories = await _categoryRepository.fetchCategories();
        yield CategoriesState.success(categories);
      } catch (error) {
        print(error);
        yield CategoriesState.failure(error.toString());
      }
    }

    if (event is DeleteCategory) {
      yield CategoriesState.initial();

      try {
        // delete category
        await _categoryRepository.deleteCategory(categoryId: event.categoryId);

        // delete category image
        await _categoryImageRepository.deleteCategoryImage(
            categoryId: event.categoryId);

        print('after category image');

        // fetch products
        List<Category> categories = await _categoryRepository.fetchCategories();
        yield CategoriesState.success(categories);
      } catch (error) {
        print(error);
        yield CategoriesState.failure(error.toString());
      }
    }
  }
}
