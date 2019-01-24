import 'package:eazy_shop/models/category.dart';
import 'package:eazy_shop/pages/admin/category_form_page/category_form.dart';
import 'package:eazy_shop/pages/admin/category_form_page/category_form_bloc.dart';
import 'package:flutter/material.dart';

class CategoryFormPage extends StatefulWidget {
  final Category category;

  const CategoryFormPage({Key key, this.category}) : super(key: key);

  @override
  _CategoryFormPageState createState() => _CategoryFormPageState();
}

class _CategoryFormPageState extends State<CategoryFormPage> {
  CategoryFormBloc _categoryFormBloc;

  @override
  initState() {
    _categoryFormBloc = CategoryFormBloc();
    super.initState();
  }

  @override
  dispose() {
    _categoryFormBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CategoryForm(
        categoryFormBloc: _categoryFormBloc,
        category: widget.category,
      ),
    );
  }
}
