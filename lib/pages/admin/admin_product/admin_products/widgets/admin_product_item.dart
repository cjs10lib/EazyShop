import 'package:eazy_shop/models/product.dart';
import 'package:flutter/material.dart';

class AdminProductItem extends StatelessWidget {
  final Product product;

  const AdminProductItem({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color _textColor = Colors.grey;
    final Color _cardColor = Color.fromRGBO(42, 44, 49, 1);
    final Color _containerColor1 = Color.fromRGBO(47, 49, 54, 1);
    final Color _containerColor2 = Color.fromRGBO(54, 57, 63, 1);

    return Column(
      children: <Widget>[
        SizedBox(height: 20.0),
        Material(
          elevation: 1.0,
          child: Container(
            color: _cardColor,
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60.0)),
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
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('${product.title}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                            Material(
                              elevation: 2.0,
                              color: _containerColor1,
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                height: 40.0,
                                width: 40.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Text(
                                  '${product.quantity.toString()}',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          product.description.length > 50
                              ? '${product.description.substring(0, 50)}...'
                              : '${product.description}',
                          softWrap: true,
                          style: TextStyle(
                              color: _textColor, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              'GHc ${product.price.toString()}',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('/product');
                              },
                              child: Material(
                                elevation: 2.0,
                                child: Container(
                                  height: 40.0,
                                  width: 120.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(0, 17, 34, 1)),
                                  child: Text(
                                    'View Product',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
