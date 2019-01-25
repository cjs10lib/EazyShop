import 'package:eazy_shop/pages/product/product_details/widgets/product_details.dart';
import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  // final _textColor = Colors.grey;
  // final Color _cardColor = Color.fromRGBO(42, 44, 49, 1);
  // final Color _containerColor1 = Color.fromRGBO(47, 49, 54, 1);
  // final Color _containerColor2 = Color.fromRGBO(54, 57, 63, 1);

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
    return FlexibleSpaceBar(
      background: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/temp1.jpg'),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(Color(0xA0000000), BlendMode.multiply))),
      ),
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
            floating: true,
            snap: true,
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
              ProductDetails(),
            ]),
          )
        ],
      ),
    );
  }
}
