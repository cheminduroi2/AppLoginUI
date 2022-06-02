import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  _buildUnderlineBorder() => UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      );

  Widget _buildLoginField(String label) => TextField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontFamily: 'Pacifico',
          color: Colors.white,
          fontSize: 20.0,
        ),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
          enabledBorder: _buildUnderlineBorder(),
          focusedBorder: _buildUnderlineBorder(),
        ),
      );

  Widget _buildLoginButton() => Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          icon: Icon(Icons.arrow_forward),
          iconSize: 35.0,
          splashColor: Colors.white,
          color: Colors.white,
          onPressed: () {},
        ),
      );

  _build3rdPartyLoginButton(String providerName) {
    Widget loginBtn;
    switch (providerName) {
      case 'google':
        loginBtn = GoogleSignInButton(onPressed: () {});
        break;
      case 'facebook':
        loginBtn = FacebookSignInButton(onPressed: () {});
        break;
    }
    return Row(children: <Widget>[Expanded(child: loginBtn)]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212121),
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 140.0),
            Expanded(
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/world.png',
                    width: 125.0,
                    height: 125.0,
                  ),
                  SizedBox(height: 3.0),
                  Text(
                    'Dilemmas',
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      color: Colors.white,
                      fontSize: 26.0,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.087,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50.0),
                    child: Column(
                      children: <Widget>[
                        _buildLoginField('Email'),
                        SizedBox(height: 30.0),
                        _buildLoginField('Password'),
                        SizedBox(height: 10.0),
                        _buildLoginButton(),
                        SizedBox(height: 20.0),
                        _build3rdPartyLoginButton('google'),
                        SizedBox(height: 5.0),
                        _build3rdPartyLoginButton('facebook'),
                        SizedBox(height: 8.0),
                        Align(
                          alignment: Alignment.centerRight,
                          child: FlatButton(
                            onPressed: () {},
                            splashColor: Colors.white,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 17.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
