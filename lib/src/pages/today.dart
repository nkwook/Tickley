import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tickley/src/api/api.dart';
import 'package:tickley/src/model/tUser.dart';
import 'package:tickley/src/utils/authentication.dart';
import 'package:tickley/src/widgets/taskDetailModal.dart';
import 'taskSelect.dart';

class Today extends StatefulWidget {
  User? user;
  Today({Key? key, required this.user}) : super(key: key);

  @override
  TodayState createState() => TodayState();
}

class TodayState extends State<Today> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _todayTasks = ['텀블러 사용 하기', '자가용 대신 대중교통', '일회용 수저 주문 안 하기'];
  String nickname = '';

  _getUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        TUser tUser = await userLogin(user.uid);
        if (tUser.accessToken == user.uid) {
          setState(() {
            nickname = tUser.nickname;
          });
        }
      } catch (error) {}
    }
  }

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _today(),
    );
  }

  Widget _today() {
    return Center(
        child: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        _todayTask(),
        // Text('srs'),
        _categoryTask(),
        _logoutButtonTemp()
        // Text('rr')
      ],
    )));
  }

  Widget _todayTask() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      // color: Colors.white,
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      height: 300.0,
      child: Column(
        children: [
          Text(nickname + ' 님에게 주어진 오늘의 태스크'),
          // _todayTakeList(),
          Expanded(
              child: ListView.separated(
                  itemCount: _todayTasks.length,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, i) {
                    return _buildRow(_todayTasks[i]);
                  },
                  separatorBuilder: (context, i) {
                    return const Divider();
                  }))
        ],
      ),
    );
  }

  Widget _buildRow(String task) {
    return ListTile(
      title: Text(
        task,
        style: _biggerFont,
      ),
    );
  }

  Widget _categoryTask() {
    const temp = '에너지 절약';
    return (Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        // color: Colors.red,
        decoration: BoxDecoration(border: Border.all(color: Colors.redAccent)),
        // height: 400.0,
        child: Column(children: [
          Material(
            color: Colors.green[100],
            child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TaskSelect()));
                  // showModalBottomSheet(
                  //     context: context,
                  //     builder: (BuildContext context) {
                  //       return TaskSelect();
                  //     });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text('다른 활동도 추가할래요!'),
                )),
          ),
        ])));
  }

  Widget _logoutButtonTemp() {
    return Material(
        child: InkWell(
            onTap: () {
              Authentication.signOut(context: context);
            },
            child: Container(
              child: Text("Log out"),
            )));
  }
}
