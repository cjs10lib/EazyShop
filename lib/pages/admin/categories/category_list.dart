import 'package:eazy_shop/pages/admin/categories/categories_bloc.dart';
import 'package:eazy_shop/pages/admin/categories/categories_event.dart';
import 'package:eazy_shop/pages/admin/categories/categories_state.dart';
import 'package:eazy_shop/widgets/admin/category/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryList extends StatelessWidget {
  final CategoriesBloc categoriesBloc;

  CategoryList({Key key, @required this.categoriesBloc}) : super(key: key) {
    categoriesBloc.onFetchCategories();
  }

  void _deleteCategory({@required categoryId}) {
    categoriesBloc.onDeleteCategory(categoryId: categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesEvent, CategoriesState>(
      bloc: categoriesBloc,
      builder: (BuildContext context, CategoriesState state) {
        if (state.isInitializing) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.hasError) {
          print(state.error);
          return Center(
            child: Text(
              'Oops! An error occured. Failed to fetch categories',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          );
        }
        if (state.categories.isEmpty) {
          return Center(
            child: Text(
              'No categories found!',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          );
        }

        return ListView.builder(
          itemCount: state.categories.length,
          itemBuilder: (BuildContext context, int index) {
            final category = state.categories[index];
            final categoryId = category.categoryId;

            return CategoryItem(
              categoryId: categoryId,
              image: category.imageUrl,
              title: category.title,
              description: category.description,
              deleteCategory: _deleteCategory,
            );
          },
        );
      },
    );
  }
}
