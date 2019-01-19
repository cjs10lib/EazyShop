import 'dart:async';

import 'package:eazy_shop/widgets/products/product_categories.dart';
import 'package:eazy_shop/widgets/products/products.dart';
import 'package:eazy_shop/widgets/shopping_cart/shopping_cart_item.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  final _controlColor = Color.fromRGBO(47, 49, 54, 1);
  final _textColor = Colors.grey;
  final Color _cardColor = Color.fromRGBO(42, 44, 49, 1);
  final Color _containerColor1 = Color.fromRGBO(47, 49, 54, 1);
  final Color _containerColor2 = Color.fromRGBO(54, 57, 63, 1);

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

  Widget _buildDrawerToggle() {
    return IconButton(
      icon: Icon(
        Icons.menu,
        color: _textColor,
        size: 30.0,
      ),
      onPressed: () {},
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
            fillColor: _controlColor,
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
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ProductCategories(),
          SizedBox(height: 20.0),
          _buildSearchTextField(),
          // SizedBox(height: 20.0),
        ],
      ),
    );
  }

  Widget _buildShoppingCartFAB({@required BuildContext context}) {
    return FloatingActionButton(
        isExtended: true,
        backgroundColor: Theme.of(context).backgroundColor,
        child: Icon(
          Icons.shopping_basket,
          size: 40.0,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          _openShoppingCartBottomSheet(context: context);
          // Navigator.of(context).pushNamed('/shopping-cart');
        });
  }

  Widget _buildShoppingCartBottomSheetHeader({@required BuildContext context}) {
    return PreferredSize(
      preferredSize: Size.fromHeight(85.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
        child: Column(
          children: <Widget>[
            Container(
              width: 100.0,
              height: 5.0,
              color: _textColor,
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'My Cart',
                  style: TextStyle(
                      color: _textColor,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w900),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/checkout');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                    decoration: BoxDecoration(
                        color: _cardColor,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.shopping_basket,
                          size: 30.0,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 7.0),
                        Text(
                          '\$5000.00',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          '[10 Items]',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0)
          ],
        ),
      ),
    );
  }

  Future _openShoppingCartBottomSheet({@required BuildContext context}) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 600.0,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    centerTitle: false,
                    pinned: true,
                    floating: true,
                    snap: true,
                    automaticallyImplyLeading: false,
                    expandedHeight: 0.0,
                    backgroundColor: Theme.of(context).backgroundColor,
                    bottom:
                        _buildShoppingCartBottomSheetHeader(context: context),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      ShoppingCartItem(
                        productIndex: 5,
                      ),
                      ShoppingCartItem(
                        productIndex: 7,
                      ),
                      ShoppingCartItem(
                        productIndex: 9,
                      )
                    ]),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        floatingActionButton: _buildShoppingCartFAB(context: context),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              centerTitle: false,
              pinned: true,
              floating: true,
              snap: true,
              // expandedHeight: 400.0,
              backgroundColor: Theme.of(context).backgroundColor,
              title: _buildSliverTitle(context),
              leading: _buildDrawerToggle(),
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
        ));
  }
}
