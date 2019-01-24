import 'dart:async';
import 'package:eazy_shop/models/category.dart';
import 'package:eazy_shop/pages/admin/category_form_page/category_form_event.dart';
import 'package:eazy_shop/pages/admin/category_form_page/category_form_state.dart';
import 'package:eazy_shop/repositories/category_image_repository.dart';
import 'package:meta/meta.dart';

import 'package:eazy_shop/repositories/category_repository.dart';

import 'package:bloc/bloc.dart';

class CategoryFormBloc extends Bloc<CategoryFormEvent, CategoryFormState> {
  final _categoryRepository = CategoryRepository();
  final _categoryImageRepository = CategoryImageRepository();

  @override
  CategoryFormState get initialState => CategoryFormState.initial();

  void onCreateCategory(
      {@required String title, @required String description, @required image}) {
    dispatch(
        CreateCategory(title: title, description: description, image: image));
  }

  void onCreatedCategory() {
    dispatch(CreatedCategory());
  }

  void onUpdateCategory(
      {@required String categoryId,
      @required String title,
      @required String description,
      @required image}) {
    dispatch(UpdateCategory(
        categoryId: categoryId,
        title: title,
        description: description,
        image: image));
  }

  @override
  Stream<CategoryFormState> mapEventToState(
      CategoryFormState currentState, CategoryFormEvent event) async* {
    if (event is CreateCategory) {
      yield CategoryFormState.loading();
      Map<String, dynamic> _categoryImage;

      try {
        // create category image
        _categoryImage = await _categoryImageRepository.createCategoryImage(
            categoryimage: event.image);

        // create category with category-image
        await _categoryRepository.createCategory(
          categoryId: _categoryImage['categoryImageId'],
          title: event.title,
          description: event.description,
          imageUrl: _categoryImage['downloadUrl'],
        );
        yield CategoryFormState.success(_categoryImage['categoryImageId']);
      } catch (error) {
        yield CategoryFormState.failure(error.toString());
      }
    }

    if (event is CreatedCategory) {
      yield CategoryFormState.initial();
    }

    if (event is UpdateCategory) {
      yield CategoryFormState.loading();

      try {
        await _categoryRepository.updateCategory(
          categoryId: event.categoryId,
          title: event.title,
          description: event.description,
          imageUrl: event.image.toString(),
        );
        print('after update');
        yield CategoryFormState.success(event.categoryId);
      } catch (error) {
        print(error.toString());
        yield CategoryFormState.failure(error.toString());
      }
    }
  }
}
