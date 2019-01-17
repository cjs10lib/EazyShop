import 'package:eazy_shop/widgets/products/product_categories.dart';
import 'package:eazy_shop/widgets/products/products.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  final _controlColor = Color.fromRGBO(47, 49, 54, 1);
  final _textColor = Colors.grey;
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
      preferredSize: Size.fromHeight(280.0),
      child: Column(
        children: <Widget>[
          ProductCategories(),
          SizedBox(height: 20.0),
          _buildSearchTextField()
        ],
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
              expandedHeight: 320.0,
              backgroundColor: Theme.of(context).backgroundColor,
              leading: _buildDrawerToggle(),
              actions: <Widget>[
                _buildFavoriteToggle(),
              ],
              title: _buildSliverTitle(context),
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
