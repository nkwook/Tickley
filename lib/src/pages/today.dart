import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tickley/src/api/api.dart';
import 'package:tickley/src/model/t_user.dart';
import 'package:tickley/src/model/task.dart';
import 'package:tickley/src/utils/authentication.dart';
import 'package:tickley/src/widgets/checklistWidget.dart';
import 'package:tickley/utils/widget_functions.dart';
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
  List<Task>? favoriteTask;
  List<Task>? todayTask;
  List<Task>? tasks;
  TUser? tuser;
  int todayTaskIndex = 0;
  String nickname = '';

  updateUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        TUser tUser = await userLogin(user.uid);
        List<Task> fTask = await fetchFavoriteTasksByUser(tUser.id);
        List<Task> tTask = await fetchTodayTasks(tUser.id);

        if (tUser.accessToken == user.uid) {
          int tIndex = 0;
          List<Task> t = [];
          for (Task tt in tTask) {
            bool removed = false;

            for (Task ft in fTask) {
              if (tt.id == ft.id) {
                removed = true;
                break;
              }
            }
            if (!removed) {
              t.add(tt);
              tIndex++;
            }
          }

          setState(() {
            tuser = tUser;
            favoriteTask = fTask;
            todayTask = tTask;
            nickname = tUser.nickname;
            tasks = t + fTask;
          });
        }
      } catch (error) {}
    }
  }

  @override
  void initState() {
    super.initState();
    // getTodayTasks();
    updateUser();

    // setState(() {
    //   todayTask = todayTask! + favoriteTask!;
    // });
  }

  @override
  Widget build(BuildContext context) {
    if (todayTask != null && favoriteTask != null) {
      int tIndex = 0;
      List<Task> t = [];
      for (Task tt in todayTask!) {
        bool removed = false;

        for (Task ft in favoriteTask!) {
          if (tt.id == ft.id) {
            removed = true;
            break;
          }
        }
        if (!removed) {
          t.add(tt);
          tIndex++;
        }
      }

      setState(() {
        tasks = t + favoriteTask!;
        todayTaskIndex = tIndex;
      });
    }
    return Scaffold(
      body: _today(),
    );
  }

  Widget _today() {
    return Center(
        child: tuser != null
            ? SingleChildScrollView(
                child: Column(
                children: <Widget>[
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 55),
                      // margin: EdgeInsets.only(bottom: 15),
                      child: Text(
                        '오늘의 미션',
                        style: _biggerBoldFont,
                      )),
                  _todayTask(),
                  // Text('srs'),
                  _taskSelectNavigateButton(),
                  // Text('rr')
                ],
              ))
            : Container(child: CustomCircularProgressIndicator()));
  }

  Widget _todayTask() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      // color: Colors.white,
      height: 450.0,
      child: Column(
        // crossAxisAlignment: ,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // _todayTakeList(),
          Expanded(
              child: ListView.separated(
                  itemCount: tasks!.length,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, i) {
                    bool isTodayTask = true;
                    if (i >= todayTaskIndex) {
                      isTodayTask = false;
                    }
                    return ChecklistWidget(
                        task: tasks![i],
                        userId: tuser!.id,
                        isCompleted: tasks![i].completed,
                        isTodayTask: isTodayTask);
                    // _buildRow(favoriteTask![i].label);
                  },
                  separatorBuilder: (context, i) {
                    return const Divider();
                  })),
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
}
