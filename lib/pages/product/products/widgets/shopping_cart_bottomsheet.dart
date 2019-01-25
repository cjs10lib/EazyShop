
import 'dart:async';

import 'package:eazy_shop/shared_widgets/shopping_cart/shopping_cart_item.dart';
import 'package:flutter/material.dart';

class ShoppingCartBottomSheet {
  final BuildContext context;

  ShoppingCartBottomSheet({@required this.context});

  final _controlColor = Color.fromRGBO(47, 49, 54, 1);
  final _textColor = Colors.grey;
  final Color _cardColor = Color.fromRGBO(42, 44, 49, 1);
  final Color _containerColor1 = Color.fromRGBO(47, 49, 54, 1);

  Widget _buildShoppingCartBottomSheetHeader() {
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


  Future _openShoppingCartBottomSheet() {
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
                        _buildShoppingCartBottomSheetHeader(),
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

  Future openShoppingCart() async {
    return await _openShoppingCartBottomSheet();
  }
}