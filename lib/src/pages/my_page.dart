import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tickley/src/api/api.dart';
import 'package:tickley/src/model/t_user.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  late Future<TUser> userData;
  final myPageListLabel = ['내 성취 보러가기', '프로필 설정', '알림 설정'];

  @override
  void initState() {
    super.initState();
    getUser(1);
  }

  void getUser(int id) async {
    Future<TUser> u = fetchUserData(id);
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
          FutureBuilder<TUser>(
              future: userData,
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? charByPoint(snapshot.data!)
                    : Center(child: CircularProgressIndicator());
              }),
          // myPageList()
        ],
      ),
    );
  }

  Widget charByPoint(TUser userData) {
    String label;
    String imgUrl;
    int score;

    if (userData.point >= 80) {
      label = "골드 태산이";
      imgUrl = 'assets/taesan_gold.png';
      score = 80;
    } else if (userData.point >= 70) {
      label = "실버 태산이";
      imgUrl = 'assets/taesan_silver.png';
      score = 70;
    } else if (userData.point >= 60) {
      label = "브론즈 태산이";
      imgUrl = 'assets/taesan_bronze.png';
      score = 60;
    } else if (userData.point >= 50) {
      label = "골드 동산이";
      imgUrl = 'assets/dongsan_gold.png';
      score = 50;
    } else if (userData.point >= 40) {
      label = "실버 동산이";
      imgUrl = 'assets/dongsan_silver.png';
      score = 40;
    } else if (userData.point >= 30) {
      label = "브론즈 동산이";
      imgUrl = 'assets/dongsan_bronze.png';
      score = 30;
    } else if (userData.point >= 20) {
      label = "골드 티끄리";
      imgUrl = 'assets/gold.png';
      score = 20;
    } else if (userData.point >= 10) {
      label = "실버 티끄리";
      imgUrl = 'assets/silver.png';
      score = 10;
    } else {
      label = "브론즈 티끄리";
      imgUrl = 'assets/bronze.png';
      score = 0;
    }

    return Column(
      children: [
        CircleAvatar(
          radius: 80.0,
          backgroundImage: AssetImage(imgUrl),
          backgroundColor: Colors.transparent,
        ),
        Text(label),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          width: 300,
          height: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              value: (userData.point - score) / 10,
              backgroundColor: Colors.grey,
            ),
          ),
        ),
        Text((score + 10 - userData.point).toString() + '번의 미션만 더 수행하면 돼요!')
      ],
    );
  }
}
