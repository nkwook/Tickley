import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:tickley/src/api/api.dart';
import 'package:tickley/src/model/tUser/tUser.dart';

import 'package:tickley/src/utils/authentication.dart';
import 'package:tickley/src/utils/widget_functions.dart';
import 'package:intl/intl.dart';
import 'package:tickley/src/model/task_completed.dart';
import 'package:tickley/src/widgets/completed_task_widget.dart';
import 'package:tickley/src/widgets/task_widget.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  Future<TUser>? userData;
  late List<TaskCompleted> tasks = [];
  late List<TaskCompleted> userTasks = [];
  final myPageListLabel = ['내 성취 보러가기', '프로필 설정', '알림 설정'];
  int userId = 1; //temp

  _updateUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        TUser tUser = await userLogin(user.uid);
        if (tUser.accessToken == user.uid) {
          int id = tUser.id;
          setState(() {
            userId = id;
          });
          getUser(id);
          updateUserTasks(id);
        }
      } catch (error) {}
    }
  }

  @override
  void initState() {
    super.initState();
    _updateUser();
    // getUser(userId); // to remove
    // updateUserTasks(userId); //to remove
  }

  void updateUserTasks(int id) async {
    List<TaskCompleted> t = await fetchCompletedTasksByUser(id);
    print("몇번 불려" + t.length.toString());
    setState(() {
      userTasks = t;
    });
  }

  void getUser(int id) async {
    Future<TUser> u = fetchUserData(id);
    setState(() {
      userData = u;
    });
  }

  @override
  Widget build(BuildContext context) {
    return userData != null
        ? SingleChildScrollView(
            child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: Column(
              children: [
                FutureBuilder<TUser>(
                    future: userData,
                    builder: (context, snapshot) {
                      return snapshot.hasData
                          ? charByPoint(snapshot.data!)
                          : Container(
                              height: 100,
                              child: CustomCircularProgressIndicator());
                    }),
                taskItemList(),
                _logoutButtonTemp()
// myPageList()
              ],
            ),
          ))
        : Container(height: 100, child: CustomCircularProgressIndicator());
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
          backgroundColor: Color(0xffEFEFEF),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 22.0),
          child: Text(userData.nickname,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          width: 330,
          height: 20,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: LinearProgressIndicator(
              value: (userData.point - score) / 10,
              valueColor: new AlwaysStoppedAnimation<Color>(Color(0xff90CA8B)),
              backgroundColor: Color(0xffEFEFEF),
            ),
          ),
        ),
        Container(
          width: 320,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '내 Eco 포인트',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                userData.point.toString() + 'point',
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff90CA8B),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget taskItemList() {
    return Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xffEFEFEF), borderRadius: BorderRadius.circular(20)),
        width: 330,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                '내 기록',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            CompletedTaskList(tasks: userTasks, userId: userId),
          ],
        ));
  }
}

class CompletedTaskList extends StatefulWidget {
  final List<TaskCompleted> tasks;
  int userId;

  CompletedTaskList({Key? key, required this.tasks, required this.userId})
      : super(key: key);
  TaskListState createState() => TaskListState();
}

class TaskListState extends State<CompletedTaskList> {
  String formatting(TaskCompleted task) {
    var str = task.completedAt;
    var formattedDate = str.substring(0, 10);
    print(formattedDate);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    print("길이" + widget.tasks.length.toString());
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Container(height: 10);
      },
      shrinkWrap: true,
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CompletedTaskWidget(
                task: widget.tasks[index], userId: widget.userId),
            Text(formatting(widget.tasks[index]))
          ],
        );
      },
    );
  }
}
