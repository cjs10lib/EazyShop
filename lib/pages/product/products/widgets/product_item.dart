import 'package:eazy_shop/models/product.dart';
import 'package:eazy_shop/pages/product/product_details/product_details_page.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  final Color _textColor = Colors.grey;
  final Color _cardColor = const Color.fromRGBO(42, 44, 49, 1);
  final Color _containerColor1 = const Color.fromRGBO(47, 49, 54, 1);
  final Color _containerColor2 = const Color.fromRGBO(54, 57, 63, 1);

  const ProductItem({Key key, @required this.product}) : super(key: key);

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
          child: CircleAvatar(
            radius: 60.0,
            backgroundImage: NetworkImage(product.imageUrl),
          ),
        )
      ],
    );
  }

  Widget _buildProductTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Text('${product.title}',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
        ),
        Material(
          elevation: 2.0,
          color: _containerColor1,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            height: 40.0,
            width: 40.0,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
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

  Widget _buildProductBottomRow({@required BuildContext context}) {
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
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildProductDetails({@required BuildContext context}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildProductTitleRow(),
            SizedBox(height: 10.0),
            _buildProductDescription(),
            SizedBox(height: 10.0),
            _buildProductBottomRow(context: context),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                _buildProductImage(),
                _buildProductDetails(context: context)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
