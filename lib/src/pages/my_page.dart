import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tickley/src/api/api.dart';
import 'package:tickley/src/model/user.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late Future<User> userData;

  @override
  void initState() {
    super.initState();
    getUser(1);
  }

  void getUser(int id) async {
    Future<User> u = getUserData(id);
    setState(() {
      userData = u;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: Column(
          children: [
            FutureBuilder<User>(
              future: userData,
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? charByPoint(snapshot.data!)
                      : Center(child: CircularProgressIndicator());
                }),
          ],
        ),
    );
  }

  Widget charByPoint(User userData) {
    String label;
    String imgUrl;

    if(userData.point >= 20) {
      label = "골드 티끄리";
      imgUrl = 'assets/gold.png';
    } else if(userData.point >= 10) {
      label = "실버 티끄리";
      imgUrl = 'assets/silver.png';
    } else {
      label = "브론즈 티끄리";
      imgUrl = 'assets/bronze.png';
    }


    return Column(
      children: [
        CircleAvatar(
          radius: 80.0,
          backgroundImage: AssetImage(imgUrl),
          backgroundColor: Colors.transparent,
        ),
        Text(label)
      ],
    );
  }
}
