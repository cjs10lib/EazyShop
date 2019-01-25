import 'package:eazy_shop/pages/admin/admin_category/categories/categories_bloc.dart';
import 'package:eazy_shop/pages/admin/admin_category/categories/categories_event.dart';
import 'package:eazy_shop/pages/admin/admin_category/categories/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCategoryList extends StatelessWidget {
  final CategoriesBloc categoriesBloc;
  final _textColor = Colors.grey;

  ProductCategoryList({Key key, @required this.categoriesBloc})
      : super(key: key) {
    categoriesBloc.onFetchCategories();
  }

  Widget _buildCategories({@required CategoriesState state}) {
    return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: state.categories.length,
          itemBuilder: (BuildContext context, int index) {
            final category = state.categories[index];

            return Row(
              children: <Widget>[
                SizedBox(width: 20.0),
                Column(
                  children: <Widget>[
                    Container(
                      height: 80.0,
                      width: 80.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          border: Border.all(width: 2.0, color: Colors.white)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: FadeInImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(category.imageUrl),
                          placeholder: AssetImage('assets/loader/loader.gif'),
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Expanded(
                      child: Text(category.title,
                          style: TextStyle(
                              color: _textColor, fontWeight: FontWeight.w900)),
                    )
                  ],
                ),
              ],
            );
          },
        );
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

        return _buildCategories(state: state);
      },
    );
  }
}
