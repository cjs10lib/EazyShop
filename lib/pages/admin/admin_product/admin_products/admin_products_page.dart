import 'package:eazy_shop/pages/admin/admin_product/admin_products/admin_products_bloc.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_products/widgets/admin_product_list.dart';
import 'package:flutter/material.dart';

class AdminProductsPage extends StatefulWidget {
  @override
  _AdminProductsPageState createState() => _AdminProductsPageState();
}

class _AdminProductsPageState extends State<AdminProductsPage> {
  final Color _textColor = Colors.grey;
  final Color _containerColor1 = Color.fromRGBO(47, 49, 54, 1);

  AdminProductsBloc _adminProductsBloc;

  @override
  initState() {
    _adminProductsBloc = AdminProductsBloc();
    super.initState();
  }

  @override
  dispose() {
    _adminProductsBloc.dispose();
    super.dispose();
  }

  Widget _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: _textColor),
        onPressed: () =>
            Navigator.of(context).pushReplacementNamed('/products'),
      ),
      backgroundColor: Colors.transparent,
      title: Text(
        'Admin Products',
        style: TextStyle(color: _textColor),
      ),
      bottom: _buildSearchTextField(),
    );
  }

  Widget _buildSearchTextField() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
        child: TextFormField(
          style: TextStyle(
              color: _textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              hintText: 'Search',
              hintStyle: TextStyle(
                color: _textColor,
                fontWeight: FontWeight.bold,
              ),
              filled: true,
              fillColor: _containerColor1,
              prefixIcon: Icon(
                Icons.search,
                color: _textColor,
              ),
              suffixIcon: Icon(
                Icons.mic,
                color: _textColor,
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20.0))),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        floatingActionButton: FloatingActionButton(
          tooltip: 'Add Products',
          child: Icon(
            Icons.add,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () =>
              Navigator.of(context).pushNamed('/admin-product-form'),
        ),
        appBar: _buildAppBar(),
        body: AdminProductList(adminProductsBloc: _adminProductsBloc),
      ),
    );
  }
}
