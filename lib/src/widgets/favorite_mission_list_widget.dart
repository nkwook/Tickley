import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/favorite_mission/favorite_mission_cubit.dart';
import 'package:tickley/src/model/mission/mission.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/utils.dart';
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
        height: 60,
        child: Material(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            elevation: 2,
            child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                onTap: () {
                  showModalBottomSheet(
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
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.black),
                    ),
                    // boxShadow:
                    padding: const EdgeInsets.all(8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            utils.convertStringToUnicode(widget.mission.emoji) +
                                widget.mission.label,
                            style: BiggerFont,
                            textAlign: TextAlign.center,
                          ),
                          InkWell(
                              onTap: () {
                                if (!isCompleted) {
                                  BlocProvider.of<FavoriteMissionCubit>(context)
                                      .postMissionCompleted(
                                          widget.userId, widget.mission.id);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('환경 보호 성공! ' +
                                              widget.mission.point.toString() +
                                              '점 을 얻었어요.')));

                                  setIsCompleted();
                                }
                              },
                              child: Icon(
                                isCompleted
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank_rounded,
                                color: Colors.grey[500],
                                size: 35,
                              ))
                        ])))));
  }
}
