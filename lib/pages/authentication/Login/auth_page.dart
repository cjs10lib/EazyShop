import 'package:eazy_shop/models/auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controlColor = Color.fromRGBO(47, 49, 54, 1);
  final _textColor = Colors.grey;
  final Color _cardColor = Color.fromRGBO(42, 44, 49, 1);
  final Color _containerColor1 = Color.fromRGBO(47, 49, 54, 1);
  final Color _containerColor2 = Color.fromRGBO(54, 57, 63, 1);

  Map<String, dynamic> _formData = {'username': null, 'password': null};

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  AuthMode _authMode = AuthMode.Login;

  Widget _buildEmailTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Username',
        hintText: 'Enter Username',
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Enter a valid username';
        }
      },
      onSaved: (String value) {
        _formData['username'] = value;
        // _formData['email'] = '$value@kamccu.com';
      },
    );
  }

  // || !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
  //     .hasMatch(value)

  Widget _buildPasswordTextField() {
    return TextFormField(
      obscureText: true,
      decoration:
          InputDecoration(labelText: 'Password', hintText: 'Enter password'),
      controller: _passwordController,
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return 'Password should be 6+ characters';
        }
      },
      onSaved: (String value) {
        _formData['password'] = value;
      },
    );
  }

  Widget _buildConfirmPasswordTextField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: 'Confirm Password',
          hintText: 'Enter password confirmation'),
      validator: (String value) {
        if (_passwordController.text != value) {
          return 'Passwords do not match!';
        }
      },
    );
  }

  Widget _buildForgotPasswordControl() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Forgot Password?'),
      ],
    );
  }

  Widget _buildLoginControl(BuildContext context) {
    return Expanded(
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(10.0),
        child: InkWell(
          onTap: () {
            _submitForm();
          },
          child: Container(
            height: 40.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _containerColor2,
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Text(_authMode == AuthMode.Login ? 'Login' : 'Sign Up',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }

  _submitForm() async {
    FocusScope.of(context).requestFocus(FocusNode());

    // if (!_formKey.currentState.validate()) {
    //   return;
    // }
    // _formKey.currentState.save();

    Navigator.of(context).pushReplacementNamed('/products');
  }

  Widget _buildAuthModeControl(BuildContext context) {
    return Container(
      height: 50.0,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      child: Material(
        elevation: 1.0,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _authMode == AuthMode.Login
                  ? 'Not registered account yet?'
                  : 'Already have an account?',
              style: TextStyle(color: Colors.grey[700]),
            ),
            SizedBox(width: 10.0),
            GestureDetector(
                child: Text(_authMode == AuthMode.Login ? 'Sign Up' : 'Login',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
                onTap: () {
                  setState(() {
                    _authMode == AuthMode.Login
                        ? _authMode = AuthMode.Signup
                        : _authMode = AuthMode.Login;

                    _formKey.currentState.reset();
                    _passwordController.text = '';
                  });
                })
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login-background.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(.5), BlendMode.darken),
              ),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      // Image.asset('assets/logo/cua-logo-white.png'),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     Image.asset('assets/logo/logo.png',
                      //         height: 100.0, width: 100.0),
                      //     SizedBox(width: 10.0),
                      //     Column(
                      //       children: <Widget>[
                      //         Text('KAMCCU CORP',
                      //             style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontSize: 30.0,
                      //                 fontWeight: FontWeight.bold)),
                      //         Text('CREDIT UNION',
                      //             style: TextStyle(
                      //                 color: Colors.white,
                      //                 fontSize: 30.0,
                      //                 fontWeight: FontWeight.bold)),
                      //       ],
                      //     )
                      //   ],
                      // ),
                      SizedBox(height: 20.0),
                      Container(
                        // height: _authMode == AuthMode.Login ? 400.0 : 470.0,
                        width: 350.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Card(
                          child: Container(
                            padding: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _authMode == AuthMode.Login
                                      ? 'Login'
                                      : 'Sign Up',
                                  style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                _buildEmailTextField(),
                                SizedBox(height: 15.0),
                                _buildPasswordTextField(),
                                SizedBox(height: 15.0),
                                _authMode == AuthMode.Signup
                                    ? _buildConfirmPasswordTextField()
                                    : Container(),
                                SizedBox(height: 15.0),
                                _authMode == AuthMode.Login
                                    ? _buildForgotPasswordControl()
                                    : Container(),
                                SizedBox(height: 20.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    _buildLoginControl(context),
                                  ],
                                ),
                                SizedBox(height: 20.0),
                                // Row(
                                //   children: <Widget>[
                                //     CircleAvatar(
                                //       backgroundColor: Colors.transparent,
                                //       child: Text('f',
                                //           style: TextStyle(
                                //               color: Theme.of(context).primaryColor,
                                //               fontSize: 30.0,
                                //               fontWeight: FontWeight.w900)),
                                //     ),
                                //     CircleAvatar(
                                //       backgroundColor: Colors.transparent,
                                //       child: Text('G',
                                //           style: TextStyle(
                                //               color: Colors.red,
                                //               fontSize: 30.0,
                                //               fontWeight: FontWeight.w900)),
                                //     )
                                //   ],
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      _buildAuthModeControl(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
