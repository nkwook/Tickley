import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/favorite_mission/favorite_mission_cubit.dart';

import 'package:tickley/src/model/mission/mission.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/utils.dart';
import 'package:tickley/src/utils/widget_functions/mission_text.dart';
import 'package:tickley/src/utils/widget_functions/point_block.dart';
import 'package:tickley/src/utils/widget_functions/widget_functions.dart';

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
  final _normalFont = const TextStyle(fontSize: 15.0, color: Color(0xFFADADAD));
  final _missionTitle = const TextStyle(
      fontSize: 18.0, color: COLOR_GREEN, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(25.0),
              topRight: const Radius.circular(25.0))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(height: 20),
            Row(
              children: [
                MissionText(
                    emoji: widget.mission.emoji, label: widget.mission.label),
                SizedBox(
                  width: 6,
                ),
                PointBlock(point: widget.mission.point)
              ],
            ),
            Container(
              height: 165,
              padding: EdgeInsets.only(top: 16),
              child: Text(widget.mission.description, style: _normalFont),
            ),
            Material(
                color: COLOR_GREEN,
                elevation: 2,
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
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
                      width: MediaQuery.of(context).size.width,
                      height: 55,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: widget.isCompleted
                          ? const Text(
                              '완료한 활동',
                              textAlign: TextAlign.center,
                            )
                          : const Text(
                              '완료하기',
                              textAlign: TextAlign.center,
                            )),
                )),
          ],
        ),
      ),
    );
  }
}
