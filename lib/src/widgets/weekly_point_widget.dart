import 'package:flutter/material.dart';
import 'package:tickley/src/bloc/weekly_completed_mission/weekly_completed_mission_cubit.dart';
import 'package:tickley/src/model/completed_mission/completed_mission.dart';
import 'package:tickley/src/utils/constants.dart';

import 'package:tickley/src/utils/utils.dart';
import 'package:tickley/src/utils/widget_functions.dart';

class WeeklyPointWidget extends StatefulWidget {
  List<List<CompletedMission>> weeklyCompletedMission;

  WeeklyPointWidget({
    Key? key,
    required this.weeklyCompletedMission,
  }) : super(key: key);

  @override
  WeeklyPointWidgetState createState() => WeeklyPointWidgetState();
}

class WeeklyPointWidgetState extends State<WeeklyPointWidget> {
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
  }

  int getPointSumDay(List<CompletedMission> completedMission) {
    int sum = 0;
    completedMission.forEach((mission) {
      sum += mission.point;
    });
    return sum;
  }

  int getPointSumWeek() {
    int sum = 0;
    widget.weeklyCompletedMission.forEach((day) {
      sum += getPointSumDay(day);
    });
    return sum;
  }

  Color? getWidgetColor(int point) {
    return Colors.green[point * 100];
  }

  @override
  Widget build(BuildContext context) {
    final dateList = utils.getDateList();
    return Container(
        margin: EdgeInsets.only(top: 30),
        height: 120,
        child: Material(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            elevation: 2,
            child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                onTap: () {},
                child: Container(
                    width: 360.0,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.black),
                    ),
                    // boxShadow:
                    // padding: const EdgeInsets.all(8),
                    child: Column(children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "주간 에코 포인트",
                              style: FontBoldGreen20,
                              textAlign: TextAlign.center,
                            ),
                            Text('\u{1F331} ' +
                                getPointSumWeek().toString() +
                                "  ")
                          ]),
                      Container(
                          height: 60,
                          margin: EdgeInsets.only(top: 10),
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return MyTooltip(
                                    message: dateList[index].year.toString() +
                                        '/' +
                                        dateList[index].month.toString() +
                                        '/' +
                                        dateList[index].day.toString() +
                                        ': ' +
                                        getPointSumDay(widget
                                                .weeklyCompletedMission[index])
                                            .toString() +
                                        ' Points',
                                    child: Container(
                                        child: Column(children: [
                                      Text(WeekList[index]),
                                      Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  width: 0.5,
                                                  color: Colors.grey),
                                              color: getWidgetColor(
                                                  getPointSumDay(widget
                                                          .weeklyCompletedMission[
                                                      index]))),
                                          width: 40,
                                          height: 40,
                                          child: Text(
                                              dateList[index].day.toString())),
                                    ])));
                              },
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (_, index) {
                                return Container(width: 9);
                              },
                              itemCount: widget.weeklyCompletedMission.length)
                          // ],
                          ),
                      // )
                    ])))));
  }
}
