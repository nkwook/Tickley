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
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/utils.dart';
import 'package:tickley/src/utils/widget_functions.dart';

import 'package:tickley/src/widgets/completed_mission_widget.dart';
import 'package:tickley/src/widgets/my_category_chart_widget.dart';
import 'package:tickley/src/widgets/my_point_level_widget.dart';

class MyPageScreen extends StatefulWidget {
  TUser tUser;
  MyPageScreen({Key? key, required this.tUser}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CompletedMissionCubit>(context)
        .fetchCompletedMissionsByUser(widget.tUser.id);
    // to get points
    BlocProvider.of<TUserCubit>(context).fetchUserDataMyPage();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 16.0),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 24),
                  alignment: Alignment.topLeft,
                  child: Text("마이페이지", style: TitleFont)),
              BlocBuilder<TUserCubit, ts.TUserState>(builder: (_, state) {
                if (state is ts.Empty) {
                  return CustomCircularProgressIndicator();
                } else if (state is ts.Loading) {
                  return CustomCircularProgressIndicator();
                } else if (state is ts.Error) {
                  return CustomCircularProgressIndicator();
                } else if (state is ts.Loaded) {
                  return Column(children: [
                    MyPointLevelWidget(userData: state.tUser),
                    MyCategoryChartWidget(point: state.point)
                  ]);
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

  Widget missionItemList(List<CompletedMission> completedMissions, int userId) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 0, top: 10),
        child: Text(
          '내 기록',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color(0xffEFEFEF), borderRadius: BorderRadius.circular(16)),
        width: 330,
        child:
            CompletedMissionList(missions: completedMissions, userId: userId),
      )
    ]);
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
      physics: NeverScrollableScrollPhysics(),
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
