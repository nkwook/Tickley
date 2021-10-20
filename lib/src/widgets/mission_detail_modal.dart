import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/favorite_missions/favorite_mission_cubit.dart';

import 'package:tickley/src/bloc/missions/mission_cubit.dart';
import 'package:tickley/src/model/mission/mission.dart';
import 'package:tickley/src/utils/utils.dart';

class MissionDetailModal extends StatefulWidget {
  Mission mission;
  int userId;
  bool isCompleted;
  Function setIsCompleted;

  MissionDetailModal(
      {Key? key,
      required this.mission,
      required this.userId,
      required this.setIsCompleted,
      required this.isCompleted})
      : super(key: key);

  MissionDetailModalState createState() => MissionDetailModalState();
}

class MissionDetailModalState extends State<MissionDetailModal> {
  Utils utils = new Utils();
  final _normalFont = const TextStyle(fontSize: 15.0);

  final _biggerFont = const TextStyle(fontSize: 22.0);
  final _biggerFont2 = const TextStyle(
      fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(height: 20),
              Text(
                  utils.convertStringToUnicode(widget.mission.emoji) +
                      widget.mission.label,
                  style: _biggerFont),
              Divider(),
              Container(
                height: 110,
                margin: EdgeInsets.only(top: 20),
                child: Text(widget.mission.description, style: _normalFont),
              ),
              Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  elevation: 2,
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    onTap: () async {
                      if (!widget.isCompleted) {
                        BlocProvider.of<FavoriteMissionCubit>(context)
                            .postMissionCompleted(
                                widget.userId, widget.mission.id);

                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('환경 보호 성공! ' +
                                widget.mission.point.toString() +
                                '점 을 얻었어요.')));

                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text('환경 보호에 동참해주셔서 감사합니다\u{1F603}')));
                        Navigator.pop(context);
                      }
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 25),
                        child: widget.isCompleted
                            ? Text(
                                '완료한 활동\u{1F44D}',
                                style: _biggerFont2,
                                textAlign: TextAlign.center,
                              )
                            : Text(
                                '완료하기\u{2705}',
                                style: _biggerFont2,
                                textAlign: TextAlign.center,
                              )),
                  ))
            ],
          ),
        ));
  }
}
