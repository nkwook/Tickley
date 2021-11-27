import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/mission_user/mission_user_cubit.dart';
import 'package:tickley/src/bloc/mission_user/mission_user_state.dart';

import 'package:tickley/src/model/most_active_mission/most_active_mission.dart';

import 'package:tickley/src/utils/utils.dart';
import 'package:tickley/src/utils/widget_functions.dart';

class MostActiveMissionWidget extends StatefulWidget {
  MostActiveMission mission;

  MostActiveMissionWidget({Key? key, required this.mission}) : super(key: key);

  @override
  MostActiveMissionWidgetState createState() => MostActiveMissionWidgetState();
}

class MostActiveMissionWidgetState extends State<MostActiveMissionWidget> {
  Utils utils = new Utils();

  @override
  void initState() {
    BlocProvider.of<MissionUserCubit>(context)
        .fetchLastestUserbyMission(widget.mission.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 0),
        child: Material(
            elevation: 1,
            // shadowColor: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                text: utils.convertStringToUnicode(
                                    widget.mission.emoji)),
                            TextSpan(
                                text: " "+widget.mission.label,
                                style: TextStyle(color: Colors.black)),
                            
                          ])),
                      Row(children: [
                        Icon(Icons.people, color: Colors.grey),
                        Text(
                            "    " +
                                widget.mission.completedCount.toString() +
                                "명이 참여했어요!",
                            style: TextStyle(color: Colors.black))
                      ]),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                                flex: 1,
                                child:
                                    Icon(Icons.timelapse, color: Colors.grey)),
                            Flexible(
                                flex: 7,
                                child: Container(
                                  // margin: EdgeInsets.only(bottom: 10, left: 10),
                                  child: _userListView(),
                                ))
                          ]),
                    ]))));
  }

  Widget _userListView() {
    return BlocBuilder<MissionUserCubit, MissionUserState>(builder: (_, state) {
      if (state is Empty)
        return CustomCircularProgressIndicator();
      else if (state is Loading)
        return CustomCircularProgressIndicator();
      else if (state is Error)
        return CustomCircularProgressIndicator();
      else if (state is Loaded) {
        return ListView.separated(
            separatorBuilder: (context, index) {
              return Container(height: 1);
            },
            // physics: ClampingScrollPhysics(),
            padding: EdgeInsets.only(top: 3.0),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: state.users.length > 3 ? 3 : state.users.length,
            itemBuilder: (context, index) {
              return Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(state.users[index].nickname + " 님"),
                  Text(utils.getTimeDifference(state.users[index].completedAt),
                      style: TextStyle(color: Colors.grey))
                ],
              ));
            });
      }
      return Container();
    });
  }
}
