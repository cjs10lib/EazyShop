import 'package:eazy_shop/pages/admin/admin_category/categories/categories_bloc.dart';
import 'package:eazy_shop/pages/admin/admin_category/categories/category_list.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  @override
  CategoriesPageState createState() {
    return new CategoriesPageState();
  }
}

class CategoriesPageState extends State<CategoriesPage> {
  final Color _textColor = Colors.grey;

  CategoriesBloc _categoriesBloc;

  @override
  initState() {
    _categoriesBloc = CategoriesBloc();
    super.initState();
  }

  @override
  dispose() {
    _categoriesBloc.dispose();
    super.dispose();
  }

  Widget _buildAddCategoryFAB() {
    return FloatingActionButton(
      child: Icon(
        Icons.add,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: () => Navigator.of(context).pushNamed('/category-form'),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leading: IconButton(
          icon: Icon(Icons.arrow_back, color: _textColor),
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed('/products')),
      title: Text(
        'Product Categories',
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          floatingActionButton: _buildAddCategoryFAB(),
          appBar: _buildAppBar(),
          body: CategoryList(categoriesBloc: _categoriesBloc)),
    );
  }
}
