import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tickley/src/api/api.dart';
import 'package:tickley/src/model/t_user.dart';
import 'package:tickley/src/model/task.dart';
import 'package:tickley/src/utils/authentication.dart';
import 'package:tickley/src/widgets/checklistWidget.dart';
import 'task_select.dart';

class Today extends StatefulWidget {
  // User? user;
  // Today({Key? key, required this.user}) : super(key: key);
  Today({Key? key}) : super(key: key);

  @override
  TodayState createState() => TodayState();
}

class TodayState extends State<Today> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _biggerBoldFont =
      const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700);

  final _todayTasks = ['텀블러 사용 하기', '자가용 대신 대중교통', '일회용 수저 주문 안 하기'];
  List<Task>? favoriteTask;
  late TUser tuser;
  String nickname = '';

  updateUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        TUser tUser = await userLogin(user.uid);
        List<Task> fTask = await fetchFavoriteTasksByUser(tUser.id);
        if (tUser.accessToken == user.uid) {
          setState(() {
            tuser = tUser;
            favoriteTask = fTask;
            nickname = tUser.nickname;
          });
        }
      } catch (error) {}
    }
  }

  @override
  void initState() {
    super.initState();
    updateUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _today(),
    );
  }

  Widget _today() {
    return Center(
        child: favoriteTask != null
            ? SingleChildScrollView(
                child: Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        nickname + ' 님의 체크리스트',
                        style: _biggerBoldFont,
                      )),
                  _todayTask(),
                  // Text('srs'),
                  _taskSelectNavigateButton(),
                  _logoutButtonTemp()
                  // Text('rr')
                ],
              ))
            : Container(child: CircularProgressIndicator()));
  }

  Widget _todayTask() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      // color: Colors.white,
      height: 400.0,
      child: Column(
        children: [
          // _todayTakeList(),
          Expanded(
              child: ListView.separated(
                  itemCount: favoriteTask!.length,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, i) {
                    return ChecklistWidget(
                        task: favoriteTask![i],
                        userId: tuser.id,
                        isCompleted: favoriteTask![i].completed);
                    // _buildRow(favoriteTask![i].label);
                  },
                  separatorBuilder: (context, i) {
                    return const Divider();
                  }))
        ],
      ),
    );
  }

  Widget _taskSelectNavigateButton() {
    return (Container(
        // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        // decoration: BoxDecoration(
        //     border: Border.all(color: Colors.redAccent),
        //     borderRadius: BorderRadius.all(Radius.circular(20))),
        // height: 400.0,
        child: Column(children: [
      Material(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        elevation: 2,
        color: Colors.white,
        child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TaskSelect(updateToday: updateUser)));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: const EdgeInsets.all(8),
              child: Text('활동 추가하기', style: _biggerBoldFont),
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
