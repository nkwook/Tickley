import 'package:flutter/material.dart';
import 'package:tickley/src/model/mission/mission.dart';
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
  final _biggerFont = const TextStyle(fontSize: 19.0);
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
                    // width: 300.0,
                    decoration: BoxDecoration(
                      color: isCompleted ? Colors.grey : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.black),
                    ),
                    // boxShadow:
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      utils.convertStringToUnicode(widget.mission.emoji) +
                          widget.mission.label,
                      style: _biggerFont,
                      textAlign: TextAlign.center,
                    )))));
  }
}
