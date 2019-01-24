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

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  _showErrorSnackbar({@required BuildContext context, @required message}) {
    _onWidgetDidBuild(() {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(message, style: TextStyle(color: Colors.red)),
        backgroundColor: Theme.of(context).backgroundColor,
      ));
    });
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
          _showErrorSnackbar(context: context, message: state.error);
          return Center(
            child: Text('Oops! An error occured. Failed to fetch categories',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold)),
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

            return CategoryItem(
              deleteCategory: _deleteCategory,
              category: category,
            );
          },
        );
      },
    );
  }
}
