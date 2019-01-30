import 'package:eazy_shop/models/product.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  const ProductDetails({Key key, @required this.product}) : super(key: key);

  @override
  ProductDetailsState createState() {
    return new ProductDetailsState();
  }
}

class ProductDetailsState extends State<ProductDetails> {
  final _textColor = Colors.grey;

  final Color _cardColor = const Color.fromRGBO(42, 44, 49, 1);
  final Color _containerColor1 = const Color.fromRGBO(47, 49, 54, 1);
  final Color _containerColor2 = const Color.fromRGBO(54, 57, 63, 1);

  String _productSize;
  String _productColor;

  Widget _buildProductTitleRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('${widget.product.designer}',
                style: TextStyle(
                    color: Colors.white30, fontWeight: FontWeight.w900)),
            Text('${widget.product.title}',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w900)),
            Text('${widget.product.categoryName}',
                style:
                    TextStyle(color: _textColor, fontWeight: FontWeight.bold)),
          ],
        ),
        Text(
          '${widget.product.price}',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 25.0,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildProductSizeRow() {
    return Row(
      children: <Widget>[
        Icon(Icons.format_size, color: _textColor, size: 30.0),
        SizedBox(width: 10.0),
        Container(
          width: 150.0,
          child: DropdownButtonFormField(
            decoration: InputDecoration.collapsed(
                hintText: '',
                border: UnderlineInputBorder(borderSide: BorderSide.none)),
            hint: Text('Select size',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold)),
            value: _productSize,
            items: widget.product.sizes.map((dynamic size) {
              return DropdownMenuItem(
                value: size.toString().trim(),
                child: Text(size.toString().trim(),
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold)),
              );
            }).toList(),
            onChanged: (String value) {
              setState(() {
                _productSize = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductColorRow() {
    return Row(
      children: <Widget>[
        Icon(Icons.format_color_fill, color: _textColor, size: 30.0),
        SizedBox(width: 10.0),
        Container(
          width: 150.0,
          child: DropdownButtonFormField(
            decoration: InputDecoration.collapsed(
                hintText: '',
                border: UnderlineInputBorder(borderSide: BorderSide.none)),
            hint: Text('Select color',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold)),
            value: _productColor,
            items: widget.product.colors.map((dynamic color) {
              return DropdownMenuItem(
                value: color.toString().trim(),
                child: Text(color.toString().trim(),
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold)),
              );
            }).toList(),
            onChanged: (String value) {
              setState(() {
                _productColor = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductMaterialRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Icon(
          Icons.gradient,
          color: _textColor,
        ),
        SizedBox(width: 10.0),
        Text(
          '${widget.product.components}',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildProductParameters() {
    return Column(
      children: <Widget>[
        _buildProductSizeRow(),
        SizedBox(height: 10.0),
        _buildProductColorRow(),
        SizedBox(height: 10.0),
        _buildProductMaterialRow()
      ],
    );
  }

  Widget _buildProductDescription() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Text(
            '${widget.product.description}',
            softWrap: true,
            textAlign: TextAlign.justify,
            style:
                TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildTerms() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Terms & Conditions Applies!',
          softWrap: true,
          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildAddToCartControl() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        InkWell(
          onTap: () {
            print('Added to cart');
          },
          child: Material(
            elevation: 2.0,
            child: Container(
              height: 40.0,
              width: 200.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Color.fromRGBO(0, 17, 34, 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Add To Cart',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10.0),
                  Icon(
                    Icons.add_shopping_cart,
                    color: Colors.white,
                    size: 30.0,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      child: Container(
        color: _cardColor,
        padding: EdgeInsets.all(20.0),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: 400.0,
              width: 400.0,
            ),
            Positioned(
              child: Container(
                height: 400.0,
                width: 400.0,
                decoration: BoxDecoration(
                    color: _containerColor1,
                    borderRadius: BorderRadius.circular(125.0)),
              ),
            ),
            Positioned(
              child: Container(
                height: 350.0,
                width: 350.0,
                decoration: BoxDecoration(
                    color: _containerColor2,
                    borderRadius: BorderRadius.circular(175.0)),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildProductTitleRow(context),
                SizedBox(height: 20.0),
                _buildProductParameters(),
                SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Description',
                        style: TextStyle(
                            color: _textColor,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                Divider(),
                _buildProductDescription(),
                SizedBox(height: 30.0),
                _buildTerms(),
                SizedBox(height: 40.0),
                _buildAddToCartControl()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
