import 'dart:async';

import 'package:eazy_shop/shared_widgets/shopping_cart/shopping_cart_item.dart';
import 'package:flutter/material.dart';

class CheckOutPage extends StatelessWidget {
  final _controlColor = Color.fromRGBO(47, 49, 54, 1);
  final _textColor = Colors.grey;
  final Color _cardColor = Color.fromRGBO(42, 44, 49, 1);
  final Color _containerColor1 = Color.fromRGBO(47, 49, 54, 1);
  final Color _containerColor2 = Color.fromRGBO(54, 57, 63, 1);

  @override
  Widget build(BuildContext context) {
    Future _buildCheckOutSummary({@required BuildContext context}) {
      return showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 250.0,
              color: Theme.of(context).backgroundColor,
              padding: EdgeInsets.all(20.0),
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
                        'ORDER',
                        style: TextStyle(
                            color: _textColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$2500.0',
                        style: TextStyle(
                            color: _textColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'DELIVERY',
                        style: TextStyle(
                            color: _textColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$25.0',
                        style: TextStyle(
                            color: _textColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'SUMMARY',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        '\$2525.0',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900),
                      )
                    ],
                  ),
                  SizedBox(height: 30.0),
                  Container(
                      height: 60.0,
                      width: 200.0,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 15.0),
                      decoration: BoxDecoration(
                          color: _containerColor1,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text('Proceed',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold)))
                ],
              ),
            );
          });
    }

    Widget _buildCartItemsPrice() {
      return InkWell(
        onTap: () {
          _buildCheckOutSummary(context: context);
        },
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
          decoration: BoxDecoration(
              color: _cardColor, borderRadius: BorderRadius.circular(20.0)),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.shopping_basket,
                size: 25.0,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(width: 7.0),
              Text(
                '\$5000.00',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 5.0),
              Text(
                '[10 Items]',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      );
    }

    Widget _buildSliverAppBar() {
      return SliverAppBar(
        pinned: true,
        automaticallyImplyLeading: false,
        expandedHeight: 50.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: _textColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: false,
        backgroundColor: Theme.of(context).backgroundColor,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            padding: EdgeInsets.only(
                top: 20.0, right: 20.0, left: 20.0, bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Check out',
                  style: TextStyle(
                      color: _textColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w900),
                ),
                _buildCartItemsPrice()
              ],
            ),
          ),
        ),
      );
    }

    Widget _builShoppingCartItems() {
      return ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          ShoppingCartItem(
            productIndex: 5,
            showQuantityControl: true,
          ),
          ShoppingCartItem(
            productIndex: 7,
            showQuantityControl: true,
          ),
          ShoppingCartItem(
            productIndex: 4,
            showQuantityControl: true,
          ),
          ShoppingCartItem(
            productIndex: 6,
            showQuantityControl: true,
          ),
          ShoppingCartItem(
            productIndex: 2,
            showQuantityControl: true,
          ),
          Divider()
        ],
      );
    }

    Widget _buildShippingAddress() {
      return Container(
        height: 180.0,
        padding:
            EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 20.0),
        child: Column(
          children: <Widget>[
            Text(
              'Shipping Address',
              style: TextStyle(
                  color: _textColor,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w900),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(color: _containerColor1),
                    child: Icon(
                      Icons.location_on,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      'Asokoro ghana airport road.',
                      softWrap: true,
                      style: TextStyle(
                          color: _textColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Radio(
                    value: true,
                    groupValue: true,
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (bool value) {},
                  )
                ],
              ),
            ),
            Divider()
          ],
        ),
      );
    }

    Widget _buildPaymentMethod() {
      return Container(
        height: 240.0,
        padding:
            EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0, bottom: 0.0),
        child: Column(
          children: <Widget>[
            Text(
              'Payment Method',
              style: TextStyle(
                  color: _textColor,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w900),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(color: _containerColor1),
                    child: Icon(
                      Icons.mobile_screen_share,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: Text(
                      'Mobile Money.',
                      softWrap: true,
                      style: TextStyle(
                          color: _textColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Radio(
                    value: true,
                    groupValue: true,
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (bool value) {},
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: 0.0, left: 20.0, right: 20.0, bottom: 20.0),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(color: _containerColor1),
                    child: Icon(
                      Icons.transfer_within_a_station,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Expanded(
                    child: Text(
                      'PayOnDelivery.',
                      softWrap: true,
                      style: TextStyle(
                          color: _textColor,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Radio(
                    value: false,
                    groupValue: false,
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (bool value) {},
                  )
                ],
              ),
            ),
            Divider()
          ],
        ),
      );
    }

    Widget _buildCheckoutControl() {
      return InkWell(
        onTap: () {
          _buildCheckOutSummary(context: context);
        },
        child: Container(
            height: 70.0,
            width: 200.0,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            decoration: BoxDecoration(color: _containerColor1),
            child: Text('Proceed',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold))),
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          _buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _builShoppingCartItems(),
              SizedBox(height: 20.0),
              _buildShippingAddress(),
              _buildPaymentMethod(),
              _buildCheckoutControl()
            ]),
          )
        ],
      ),
    );
  }
}
