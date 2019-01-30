import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  final _textColor = Colors.grey;
  final Color _containerColor1 = Color.fromRGBO(47, 49, 54, 1);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                title: Text(
                  'MENU',
                  style: TextStyle(
                      color: _textColor,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900),
                ),
              ),
              ClipRRect(
                  borderRadius: BorderRadius.circular(60.0),
                  child: Image.asset(
                    'assets/images/temp4.jpg',
                    fit: BoxFit.cover,
                    height: 120.0,
                    width: 120.0,
                  )),
              SizedBox(height: 20.0),
              Text('example@gmail.com',
                  style: TextStyle(
                      color: _textColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)),
              FlatButton(
                child: Text(
                  'View Profile',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              ),
              Divider(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor: _containerColor1,
                          child: Icon(Icons.store_mall_directory,
                              color: Theme.of(context).primaryColor)),
                      title: Text(
                        'Admin Products',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () => Navigator.of(context)
                          .pushReplacementNamed('/admin-products'),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor: _containerColor1,
                          child: Icon(Icons.graphic_eq,
                              color: Theme.of(context).primaryColor)),
                      title: Text(
                        'Statistics',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(height: 20.0),
                    ListTile(
                      leading: CircleAvatar(
                          backgroundColor: _containerColor1,
                          child: Icon(Icons.exit_to_app,
                              color: Theme.of(context).primaryColor)),
                      title: Text(
                        'Signout',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
