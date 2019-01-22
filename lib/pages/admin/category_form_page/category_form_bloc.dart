import 'dart:async';
import 'package:eazy_shop/pages/admin/category_form_page/category_form_event.dart';
import 'package:eazy_shop/pages/admin/category_form_page/category_form_state.dart';
import 'package:meta/meta.dart';

import 'package:eazy_shop/repositories/category_repository.dart';

import 'package:bloc/bloc.dart';

class CategoryFormBloc extends Bloc<CategoryFormEvent, CategoryFormState> {
  final _categoryRepository = CategoryRepository();

  @override
  CategoryFormState get initialState => CategoryFormState.initial();

  void onCreateCategory({@required String title, @required String description}) {
    dispatch(CreateCategory(
      title: title,
      description: description,
    ));
  }

  void onCreatedCategory() {
    dispatch(CreatedCategory());
  }

  @override
  Stream<CategoryFormState> mapEventToState(
      CategoryFormState currentState, CategoryFormEvent event) async* {
    if (event is CreateCategory) {
      yield CategoryFormState.loading();

      try {
        String categoryId = await _categoryRepository.createCategory(
            title: event.title, description: event.description);
        yield CategoryFormState.success(categoryId);
      } catch (error) {
        yield CategoryFormState.failure(error);
      }
    }

    if (event is CreatedCategory) {
      yield CategoryFormState.initial();
    }
  }
}
