import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/completed_mission/completed_mission_cubit.dart';
import 'package:tickley/src/bloc/completed_mission/completed_mission_state.dart';
import 'package:tickley/src/model/completed_mission/completed_mission.dart';
import 'package:tickley/src/model/tUser/tUser.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/widget_functions/widget_functions.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('내 기록'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
            child: Container(
          alignment: Alignment.topCenter,
          child: Column(children: <Widget>[
            SizedBox(height: 30),
            BlocBuilder<CompletedMissionCubit, CompletedMissionState>(
                builder: (_, state) {
              if (state is Empty) {
                return CustomCircularProgressIndicator();
              } else if (state is Loading) {
                return CustomCircularProgressIndicator();
              } else if (state is Error) {
                return CustomCircularProgressIndicator();
              } else if (state is Loaded) {
                return Container(
                  // padding: EdgeInsets.symmetric(vertical: 10),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  // width: 350,
                  child: CompletedMissionList(missions: state.missions),
                );
              }
              return Container();
            }),
          ]),
        )));
  }
}

class CompletedMissionList extends StatefulWidget {
  final List<CompletedMission> missions;

  CompletedMissionList({Key? key, required this.missions}) : super(key: key);
  CompletedMissionListState createState() => CompletedMissionListState();
}

class CompletedMissionListState extends State<CompletedMissionList> {
  String formatting(String completedAt) {
    var formattedDate = completedAt.substring(0, 10);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    // print("길이" + widget.tasks.length.toString());
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return Divider();
        // return Divider(height: 2, color: COLOR_GREEN);
      },
      shrinkWrap: true,
      itemCount: widget.missions.length,
      itemBuilder: (context, index) {
        return Container(
            decoration: BoxDecoration(color: Colors.white
                // Color(0xFFEEEEEE)
                ),
            child: IntrinsicHeight(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 2,
                    child: Container(
                        alignment: Alignment.center,
                        child: Text(
                            formatting(widget.missions[index].completedAt)))),

                // Container(width: 1, height: 44, color: Color(0xFFDDDDDD)),
                VerticalDivider(),

                Flexible(
                    flex: 5,
                    child: Container(
                        alignment: Alignment.center,
                        child: CompletedMissionWidget(
                            mission: widget.missions[index])))
              ],
            )));
      },
    );
  }
}
