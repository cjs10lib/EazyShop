import 'package:eazy_shop/pages/product/products/widgets/product_categories.dart';
import 'package:eazy_shop/pages/product/products/widgets/products.dart';
import 'package:eazy_shop/pages/product/products/widgets/shopping_cart_bottomsheet.dart';
import 'package:eazy_shop/pages/product/products/widgets/side_drawer.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  final _textColor = Colors.grey;
  final Color _containerColor1 = Color.fromRGBO(47, 49, 54, 1);

  Widget _buildSliverTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Eazy',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic),
        ),
        Text(
          'Shop',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 25.0,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  Widget _buildFavoriteToggle() {
    return IconButton(
      icon: Icon(
        Icons.favorite_border,
        color: Colors.red,
        size: 30.0,
      ),
      onPressed: () {},
    );
  }

  Widget _buildSearchTextField() {
    return Container(
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
    );
  }

  Widget _buildAppBarBottom() {
    return PreferredSize(
      preferredSize: Size.fromHeight(285.0),
      child: Column(
        children: <Widget>[
          ProductCategories(),
          SizedBox(height: 20.0),
          _buildSearchTextField(),
        ],
      ),
    );
  }

  Widget _buildShoppingCartFAB({@required BuildContext context}) {
    final shoppingCart = ShoppingCartBottomSheet(context: context);

    return FloatingActionButton(
      isExtended: true,
      backgroundColor: Theme.of(context).backgroundColor,
      child: Icon(
        Icons.shopping_basket,
        size: 40.0,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: shoppingCart.openShoppingCart,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        drawer: SideDrawer(),
        floatingActionButton: _buildShoppingCartFAB(context: context),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              centerTitle: false,
              pinned: true,
              floating: true,
              snap: true,
              backgroundColor: Theme.of(context).backgroundColor,
              title: _buildSliverTitle(context),
              automaticallyImplyLeading: true,
              actions: <Widget>[
                _buildFavoriteToggle(),
              ],
              bottom: _buildAppBarBottom(),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Products(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
