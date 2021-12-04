import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/auth/auth_cubit.dart';
import 'package:tickley/src/bloc/auth/auth_state.dart';

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
    return BlocBuilder<AuthCubit, AuthState>(builder: (_, state) {
      return _loginScreen();
    });
  }

  Widget _loginScreen() {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: <Widget>[
              _appLogo(),
              widget.initLoad || _isSigningIn
                  ? CustomCircularProgressIndicator()
                  : _loginButton(),
            ],
          ),
        ));
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
        child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is Loaded) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('로그인 되었습니다')),
                );
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BottomNavigator(tUser: state.tUser)));
                setState(() {
                  _isSigningIn = false;
                });
              } else if (state is Register) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('회원가입을 진행해주세요')),
                );

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()));
              }
              setState(() {
                _isSigningIn = false;
              });
            },
            child: InkWell(
                onTap: () async {
                  setState(() {
                    _isSigningIn = true;
                  });
                  User? user =
                      await Authentication.signInWithGoogle(context: context);

                  if (user != null) {
                    BlocProvider.of<AuthCubit>(context).userLogin(user.uid);
                  }

                  setState(() {
                    _isSigningIn = false;
                  });
                },
                // },
                child: Container(
                  width: 250,
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/google_logo.png'),
                          width: 50,
                          height: 50,
                        ),
                        Text('Sign In with Google')
                      ]),
                ))));
  }
}
