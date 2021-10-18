import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tickley/src/api/api.dart';
import 'package:tickley/src/model/tUser/tUser.dart';

import 'package:tickley/src/screens/register_screen.dart';
import 'package:tickley/src/utils/authentication.dart';
import 'package:tickley/src/utils/widget_functions.dart';
import '../bottom_navigator.dart';

class LoginScreen extends StatefulWidget {
  bool initLoad;

  LoginScreen({
    Key? key,
    required this.initLoad,
  }) : super(key: key);

  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  bool _isSigningIn = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loginScreen(),
    );
  }

  Widget _loginScreen() {
    return Center(
      child: Column(
        children: <Widget>[
          _appLogo(),
          widget.initLoad || _isSigningIn
              ? CustomCircularProgressIndicator()
              : _loginButton(),
        ],
      ),
    );
  }

  Widget _appLogo() {
    return Container(
        height: 200,
        margin: EdgeInsets.only(top: 200, bottom: 100, left: 40, right: 40),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/logo_tickle.png'),
                fit: BoxFit.contain)));
  }

  Widget _loginButton() {
    // Widget
    return Material(
        elevation: 3,
        color: Colors.white,
        child: InkWell(
            onTap: () async {
              setState(() {
                _isSigningIn = true;
              });
              User? user =
                  await Authentication.signInWithGoogle(context: context);
              if (user != null) {
                try {
                  TUser tUser = await userLogin(user.uid);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('로그인 되었습니다')),
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BottomNavigator()));
                  setState(() {
                    _isSigningIn = false;
                  });
                } on Exception catch (exception) {
                  print(exception);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Register(user: user)));
                } catch (error) {
                  print(error);
                }

                // print(tUser);
                // if (tUser.accessToken != null) {
                // } else {
                setState(() {
                  _isSigningIn = false;
                });
              }
            },
            child: Container(
              width: 250,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Image(
                  image: AssetImage('assets/google_logo.png'),
                  width: 50,
                  height: 50,
                ),
                Text('Sign In with Google')
              ]),
            )));
  }
}
