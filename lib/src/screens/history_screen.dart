import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/completed_mission/completed_mission_cubit.dart';
import 'package:tickley/src/bloc/completed_mission/completed_mission_state.dart';
import 'package:tickley/src/model/completed_mission/completed_mission.dart';
import 'package:tickley/src/model/tUser/tUser.dart';
import 'package:tickley/src/utils/widget_functions.dart';
import 'package:tickley/src/widgets/completed_mission_widget.dart';

class HistoryScreen extends StatefulWidget {
  TUser tUser;

  HistoryScreen({Key? key, required this.tUser}) : super(key: key);

  @override
  HistoryScreenState createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CompletedMissionCubit>(context)
        .fetchCompletedMissionsByUser(widget.tUser.id);
  }

  Widget missionItemList(List<CompletedMission> completedMissions, int userId) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
                color: Color(0xffEFEFEF),
                borderRadius: BorderRadius.circular(16)),
            width: 330,
            child: CompletedMissionList(
                missions: completedMissions, userId: userId),
          )
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            BlocBuilder<CompletedMissionCubit, CompletedMissionState>(
                builder: (_, state) {
              if (state is Empty) {
                return CustomCircularProgressIndicator();
              } else if (state is Loading) {
                return CustomCircularProgressIndicator();
              } else if (state is Error) {
                return CustomCircularProgressIndicator();
              } else if (state is Loaded) {
                return missionItemList(state.missions, widget.tUser.id);
              }
              return Container();
            }),
          ])),
    );
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
