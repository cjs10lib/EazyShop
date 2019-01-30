import 'package:eazy_shop/pages/admin/admin_product/admin_products/admin_products_bloc.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_products/admin_products_event.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_products/admin_products_state.dart';
import 'package:eazy_shop/pages/product/products/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductList extends StatelessWidget {
  final AdminProductsBloc productsBloc;

  ProductList({Key key, @required this.productsBloc}) : super(key: key) {
    productsBloc.onFetchProducts();
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

  // void _deleteProduct({@required productId}) {
  //   adminProductsBloc.onDeleteProduct(productId: productId);
  // }

  @override
  Widget build(BuildContext context) {
    final double _screenHeight = MediaQuery.of(context).size.height;
    final double _productsListHeight = _screenHeight - 365.0;

    return BlocBuilder<AdminProductsEvent, AdminProductsState>(
      bloc: productsBloc,
      builder: (BuildContext context, AdminProductsState state) {
        if (state.isInitializing) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state.hasError) {
          print(state.error);
          _showErrorSnackbar(context: context, message: state.error);
          return Center(
            child: Text('Oops! An error occured. Failed to fetch products',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold)),
          );
        }
        if (state.products.isEmpty) {
          return Center(
            child: Text(
              'No products found!',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          );
        }
        
        return Container(
          height: _productsListHeight,
          child: ListView.builder(
            // shrinkWrap: true,
            itemCount: state.products.length,
            itemBuilder: (BuildContext context, int index) {
              final product = state.products[index];

              return ProductItem(
                product: product,
              );
            },
          ),
        );
      },
    );
  }
}
