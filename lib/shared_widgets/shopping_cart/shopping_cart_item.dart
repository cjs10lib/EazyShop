import 'package:flutter/material.dart';

class ShoppingCartItem extends StatelessWidget {
  final int productIndex;
  final bool showQuantityControl;

  const ShoppingCartItem(
      {Key key, @required this.productIndex, this.showQuantityControl = false})
      : super(key: key);

  Widget _buildViewProductControl(
      {@required BuildContext context,
      @required Color backgroundColor,
      @required Color textColor}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/product');
      },
      child: Material(
        elevation: 1.0,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20.0)),
          child: Text(
            'View Product',
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _buildProductQTYControl(
      {@required BuildContext context,
      @required Color backgroundColor,
      @required Color textColor}) {
    return Row(
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Material(
            elevation: 1.0,
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0)),
              ),
              child: Text(
                '-',
                style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Material(
          elevation: 1.0,
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(color: backgroundColor),
            child: Text(
              '10',
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Material(
            elevation: 1.0,
            color: Colors.transparent,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0)),
              ),
              child: Text(
                '+',
                style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShoppingCartItemControl(
      {@required BuildContext context,
      @required Color backgroundColor,
      @required Color textColor}) {
    return showQuantityControl
        ? _buildProductQTYControl(
            context: context,
            backgroundColor: backgroundColor,
            textColor: textColor)
        : _buildViewProductControl(
            context: context,
            backgroundColor: backgroundColor,
            textColor: textColor);
  }

  @override
  Widget build(BuildContext context) {
    // final _controlColor = Color.fromRGBO(47, 49, 54, 1);
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
            // width: 300.0,
            color: _cardColor,
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                            color: _containerColor1,
                            borderRadius: BorderRadius.circular(25.0))),
                    Positioned(
                      top: 5.0,
                      left: 5.0,
                      child: Container(
                          height: 90.0,
                          width: 90.0,
                          decoration: BoxDecoration(
                              color: _containerColor2,
                              borderRadius: BorderRadius.circular(45.0))),
                    ),
                    Positioned(
                      top: 10.0,
                      left: 10.0,
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundImage:
                            AssetImage('assets/images/temp$productIndex.jpg'),
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
                            Text('Spray Cans',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold)),
                            Container(
                              height: 40.0,
                              width: 40.0,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: _containerColor1,
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: IconButton(
                                icon: Icon(
                                  Icons.close,
                                  size: 25.0,
                                  color: Colors.red,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'This is a very nice material suit bla...',
                          softWrap: true,
                          style: TextStyle(
                              color: _textColor, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'Color: grey',
                          softWrap: true,
                          style: TextStyle(
                              color: _textColor, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                              '\$38.08',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            _buildShoppingCartItemControl(
                                context: context,
                                backgroundColor: _containerColor2,
                                textColor: _textColor)
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
