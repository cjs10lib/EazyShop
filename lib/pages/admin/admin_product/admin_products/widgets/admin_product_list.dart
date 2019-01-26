import 'package:eazy_shop/pages/admin/admin_product/admin_products/admin_products_bloc.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_products/admin_products_event.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_products/admin_products_state.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_products/widgets/admin_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminProductList extends StatelessWidget {
  final AdminProductsBloc adminProductsBloc;

  AdminProductList({Key key, @required this.adminProductsBloc})
      : super(key: key) {
    adminProductsBloc.onFetchProducts();
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
    return BlocBuilder<AdminProductsEvent, AdminProductsState>(
      bloc: adminProductsBloc,
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

        return ListView.builder(
          itemCount: state.products.length,
          itemBuilder: (BuildContext context, int index) {
            final product = state.products[index];

            return AdminProductItem(
              product: product,
            );
          },
        );
      },
    );
  }
}
