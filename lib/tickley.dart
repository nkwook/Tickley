import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tickley/src/api/api.dart';
import 'package:tickley/src/model/tUser.dart';
import 'package:tickley/src/pages/login.dart';

import 'src/bottomNavigator.dart';

class TickelyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '티끌리',
      home: Tickely(),
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
    );
  }
}

class Tickely extends StatefulWidget {
  TickelyState createState() => TickelyState();
}

class TickelyState extends State<Tickely> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isSigning = true;
  late bool signed;
  User? user;

  _loginTest() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        TUser tUser = await userLogin(user.uid);
        if (tUser.accessToken == user.uid) {
          setState(() {
            // user = user;
            signed = true;
            isSigning = false;
          });
        }
      } catch (error) {}
    }
    setState(() {
      isSigning = false;
    });
  }

  @override
  void initState() {
    super.initState();

    signed = false;
    _loginTest();
  }

  @override
  Widget build(BuildContext context) {
    return isSigning
        ? Login(
            initLoad: true,
          )
        : signed
            ? BottomNavigator()
            : Login(initLoad: false);
  }
}
