import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/favorite_mission/favorite_mission_cubit.dart';
import 'package:tickley/src/bloc/favorite_mission/favorite_mission_state.dart';
import 'package:tickley/src/bloc/weekly_completed_mission/weekly_completed_mission_cubit.dart';
import 'package:tickley/src/bloc/weekly_completed_mission/weekly_completed_mission_state.dart'
    as ws;

import 'package:tickley/src/model/tUser/tUser.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/widgets/favorite_mission_list_widget.dart';
import 'package:tickley/src/utils/widget_functions.dart';
import 'package:tickley/src/widgets/weekly_point_widget.dart';
import 'mission_select_screen.dart';

class MissionListScreen extends StatefulWidget {
  TUser tUser;
  MissionListScreen({Key? key, required this.tUser}) : super(key: key);

  @override
  MissionListScreenState createState() => MissionListScreenState();
}

class MissionListScreenState extends State<MissionListScreen> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<FavoriteMissionCubit>(context)
        .fetchFavoriteMissionsByUser(widget.tUser.id);

    BlocProvider.of<WeeklyCompletedMissionCubit>(context)
        .fetchWeeklyCompletedMissionsByUser(widget.tUser.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add, size: 30),
            backgroundColor: Colors.green,
            elevation: 2,
            onPressed: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return MissionSelectScreen(tUser: widget.tUser);
                  });
            }),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 70),
                padding: EdgeInsets.only(left: 25),
                child: Text(
                  '에코 미션',
                  style: FontBoldGreen24,
                )),
            BlocBuilder<WeeklyCompletedMissionCubit,
                ws.WeeklyCompletedMissionState>(builder: (_, state) {
              if (state is ws.Empty) {
                return CustomCircularProgressIndicator();
              } else if (state is ws.Loading) {
                return CustomCircularProgressIndicator();
              } else if (state is ws.Error) {
                return CustomCircularProgressIndicator();
              } else if (state is ws.Loaded) {
                return WeeklyPointWidget(
                    weeklyCompletedMission: state.missions);
              }
              return Container();
            }),
            _favoriteMission(),
            SizedBox(
              height: 50,
            )
          ],
        )));
  }

  Widget _favoriteMission() {
    return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: BlocBuilder<FavoriteMissionCubit, FavoriteMissionState>(
            builder: (_, state) {
          if (state is Empty) {
            return CustomCircularProgressIndicator();
          } else if (state is Loading) {
            return CustomCircularProgressIndicator();
          } else if (state is Error) {
            return CustomCircularProgressIndicator();
          } else if (state is Loaded) {
            return
                // Flexible(
                //     child:

                ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.missions.length,
                    padding: const EdgeInsets.all(16),
                    itemBuilder: (context, i) {
                      return FavoriteMissionListWidget(
                          mission: state.missions[i],
                          userId: widget.tUser.id,
                          isCompleted: state.missions[i].completed);
                    },
                    separatorBuilder: (context, i) {
                      return const Divider();
                    });
          }
          return Container();
        }));
  }
}
