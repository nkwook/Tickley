import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/favorite_mission/favorite_mission_cubit.dart';
import 'package:tickley/src/bloc/weekly_completed_mission/weekly_completed_mission_cubit.dart';
import 'package:tickley/src/model/mission/mission.dart';

import 'package:tickley/src/utils/utils.dart';
import 'package:tickley/src/utils/widget_functions/mission_text.dart';
import 'package:tickley/src/utils/widget_functions/widget_functions.dart';
import 'mission_detail_modal.dart';

class FavoriteMissionListWidget extends StatefulWidget {
  Mission mission;
  int userId;
  bool isCompleted;

  FavoriteMissionListWidget({
    Key? key,
    required this.mission,
    required this.userId,
    required this.isCompleted,
  }) : super(key: key);

  @override
  FavoriteMissionListWidgetState createState() =>
      FavoriteMissionListWidgetState();
}

class FavoriteMissionListWidgetState extends State<FavoriteMissionListWidget> {
  Utils utils = new Utils();
  bool isCompleted = false;
  bool isClicked = false;

  setIsCompleted() {
    setState(() {
      isCompleted = true;
      isClicked = true;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      isCompleted = widget.isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isClicked) {
      setState(() {
        isCompleted = widget.isCompleted;
      });
      // print(isCompleted);
    }
    return Container(
        height: 80,
        child: Container(
            //padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xffECEDEF),
                width: 1.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: Container(
                child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return MissionDetailModal(
                                mission: widget.mission,
                                userId: widget.userId,
                                isCompleted: isCompleted,
                                setIsCompleted: setIsCompleted);
                          });
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: isCompleted ? Colors.green[50] : Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                        ),
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        // boxShadow:
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MissionText(
                                  emoji: widget.mission.emoji,
                                  label: widget.mission.label),
                              InkWell(
                                  onTap: () async {
                                    if (!isCompleted) {
                                      await BlocProvider.of<
                                              FavoriteMissionCubit>(context)
                                          .postMissionCompleted(
                                              widget.userId, widget.mission.id);

                                      BlocProvider.of<
                                                  WeeklyCompletedMissionCubit>(
                                              context)
                                          .fetchWeeklyCompletedMissionsByUser(
                                              widget.userId);

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Text('환경 보호 성공! ' +
                                                  widget.mission.point
                                                      .toString() +
                                                  '점 을 얻었어요.')));

                                      setIsCompleted();
                                    }
                                  },
                                  child: Icon(
                                    isCompleted
                                        ? Icons.check_circle_rounded
                                        : Icons.circle_outlined,
                                    color: const Color(0x778AE5A3),
                                    size: 35,
                                  ))
                            ]))))));
  }
}
