import 'dart:async';

import 'package:eazy_shop/models/action_constants.dart';
import 'package:eazy_shop/models/product.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_product_form/admin_product_form.dart';
import 'package:eazy_shop/pages/admin/admin_product/admin_product_form/admin_product_form_page.dart';
import 'package:eazy_shop/pages/product/product_details/product_details_page.dart';
import 'package:flutter/material.dart';

class AdminProductItem extends StatelessWidget {
  final Product product;
  final Function deleteProduct;

  final Color _textColor = Colors.grey;
  final Color _cardColor = const Color.fromRGBO(42, 44, 49, 1);
  final Color _containerColor1 = const Color.fromRGBO(47, 49, 54, 1);
  final Color _containerColor2 = const Color.fromRGBO(54, 57, 63, 1);

  const AdminProductItem(
      {Key key, @required this.product, @required this.deleteProduct})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildProductImage() {
      return Stack(
        children: <Widget>[
          Container(
              height: 150.0,
              width: 150.0,
              decoration: BoxDecoration(
                  color: _containerColor1,
                  borderRadius: BorderRadius.circular(50.0))),
          Positioned(
            top: 5.0,
            left: 5.0,
            child: Container(
                height: 140.0,
                width: 140.0,
                decoration: BoxDecoration(
                    color: _containerColor2,
                    borderRadius: BorderRadius.circular(70.0))),
          ),
          Positioned(
            top: 15.0,
            left: 15.0,
            child: Container(
              height: 120.0,
              width: 120.0,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(60.0)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60.0),
                child: FadeInImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(product.imageUrl),
                  placeholder: AssetImage('assets/loader/loader.gif'),
                ),
              ),
            ),
          )
        ],
      );
    }

    Future _openDeleteConfirmationDialog() {
      return showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Delete Product',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              content: Text('Are you sure of deleting ${product.title}?'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                RaisedButton(
                  color: Theme.of(context).backgroundColor,
                  textColor: Theme.of(context).primaryColor,
                  child: Text('Delete'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    deleteProduct(productId: product.productId);
                  },
                )
              ],
            );
          });
    }

    Future _choiceAction(String action) async {
      if (action == AdminConstants.Update) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  AdminProductFormPage(product: product)),
                  // AdminProductForm(product: product)),
        );
      } else if (action == AdminConstants.Delete) {
        await _openDeleteConfirmationDialog();
      }
    }

    Widget _buildProductTitleRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Text(
                product.title.length > 20
                    ? '${product.title.substring(0, 20)}...'
                    : '${product.title}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
          ),
          Row(
            children: <Widget>[
              Material(
                elevation: 2.0,
                color: _containerColor1,
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  child: Text(
                    '${product.quantity.toString()}',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              PopupMenuButton<String>(
                onSelected: _choiceAction,
                itemBuilder: (BuildContext context) {
                  return AdminConstants.actions.map((String action) {
                    return PopupMenuItem<String>(
                      child: Text(action),
                      value: action,
                    );
                  }).toList();
                },
              )
            ],
          ),
        ],
      );
    }

    Widget _buildProductDescription() {
      return Text(
        product.description.length > 50
            ? '${product.description.substring(0, 50)}...'
            : '${product.description}',
        softWrap: true,
        style: TextStyle(color: _textColor, fontWeight: FontWeight.bold),
      );
    }

    Widget _buildProductPriceControl({@required BuildContext context}) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            'GHc${product.price}',
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {
              // Navigator.of(context).pushNamed('/product');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ProductDetailsPage(product: product),
                ),
              );
            },
            child: Material(
              elevation: 2.0,
              child: Container(
                height: 40.0,
                width: 120.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Color.fromRGBO(0, 17, 34, 1)),
                child: Text(
                  'View Product',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      );
    }

    Widget _buildProductCard({@required BuildContext context}) {
      return Material(
        elevation: 1.0,
        child: Container(
          color: _cardColor,
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildProductImage(),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildProductTitleRow(),
                      SizedBox(height: 10.0),
                      _buildProductDescription(),
                      SizedBox(height: 10.0),
                      _buildProductPriceControl(context: context),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        _buildProductCard(context: context),
      ],
    );
  }
}
