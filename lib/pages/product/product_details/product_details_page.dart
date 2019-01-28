import 'package:eazy_shop/models/product.dart';
import 'package:eazy_shop/pages/product/product_details/widgets/product_details.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({Key key, @required this.product}) : super(key: key);

  Widget _buildDrawerToggle({@required BuildContext context}) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.white,
        size: 30.0,
      ),
      onPressed: () => Navigator.of(context).pop(),
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

  Widget _buildFlexibleSpaceBarImage() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(product.imageUrl),
              fit: BoxFit.cover,
              colorFilter:
                  ColorFilter.mode(Color(0xA0000000), BlendMode.multiply))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            pinned: true,
            // floating: true,
            // snap: true,
            expandedHeight: 500.0,
            backgroundColor: Theme.of(context).backgroundColor,
            leading: _buildDrawerToggle(context: context),
            actions: <Widget>[
              _buildFavoriteToggle(),
            ],
            flexibleSpace: _buildFlexibleSpaceBarImage(),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ProductDetails(product: product),
            ]),
          )
        ],
      ),
    );
  }
}
