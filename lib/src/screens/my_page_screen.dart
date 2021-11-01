import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tickley/src/bloc/completed_mission/completed_mission_cubit.dart';
import 'package:tickley/src/bloc/completed_mission/completed_mission_state.dart'
    as cs;
import 'package:tickley/src/bloc/tUser/tUser_cubit.dart';
import 'package:tickley/src/bloc/tUser/tUser_state.dart' as ts;
import 'package:tickley/src/model/completed_mission/completed_mission.dart';
import 'package:tickley/src/model/tUser/tUser.dart';

import 'package:tickley/src/utils/authentication.dart';
import 'package:tickley/src/utils/widget_functions.dart';

import 'package:tickley/src/widgets/completed_mission_widget.dart';

class MyPageScreen extends StatefulWidget {
  TUser tUser;
  MyPageScreen({Key? key, required this.tUser}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  final myPageListLabel = ['내 성취 보러가기', '프로필 설정', '알림 설정'];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CompletedMissionCubit>(context)
        .fetchCompletedMissionsByUser(widget.tUser.id);
    // to get points
    BlocProvider.of<TUserCubit>(context).fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.symmetric(vertical: 70.0, horizontal: 16.0),
      child: Column(
        children: [
          BlocBuilder<TUserCubit, ts.TUserState>(builder: (_, state) {
            if (state is ts.Empty) {
              return CustomCircularProgressIndicator();
            } else if (state is ts.Loading) {
              return CustomCircularProgressIndicator();
            } else if (state is ts.Error) {
              return CustomCircularProgressIndicator();
            } else if (state is ts.Loaded) {
              return charByPoint(state.tUser);
            }
            return Container();
          }),
          BlocBuilder<CompletedMissionCubit, cs.CompletedMissionState>(
              builder: (_, state) {
            if (state is cs.Empty) {
              return CustomCircularProgressIndicator();
            } else if (state is cs.Loading) {
              return CustomCircularProgressIndicator();
            } else if (state is cs.Error) {
              return CustomCircularProgressIndicator();
            } else if (state is cs.Loaded) {
              return missionItemList(state.missions, widget.tUser.id);
            }
            return Container();
          }),
          _logoutButtonTemp()
// myPageList()
        ],
      ),
    ));
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

  Widget missionItemList(List<CompletedMission> completedMissions, int userId) {
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
            CompletedMissionList(missions: completedMissions, userId: userId),
          ],
        ));
  }
}

class CompletedMissionList extends StatefulWidget {
  final List<CompletedMission> missions;
  int userId;

  CompletedMissionList({Key? key, required this.missions, required this.userId})
      : super(key: key);
  CompletedMissionListState createState() => CompletedMissionListState();
}

class CompletedMissionListState extends State<CompletedMissionList> {
  String formatting(CompletedMission mission) {
    var str = mission.completedAt;
    var formattedDate = str.substring(0, 10);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    // print("길이" + widget.tasks.length.toString());
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Container(height: 10);
      },
      shrinkWrap: true,
      itemCount: widget.missions.length,
      itemBuilder: (context, index) {
        return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CompletedMissionWidget(
                    mission: widget.missions[index], userId: widget.userId),
                Text(formatting(widget.missions[index]))
              ],
            ));
      },
    );
  }
}
