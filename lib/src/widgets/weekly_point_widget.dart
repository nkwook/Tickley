import 'package:flutter/material.dart';
import 'package:tickley/src/model/mission/mission.dart';
import 'package:tickley/src/utils/utils.dart';

class WeeklyPointWidget extends StatefulWidget {
  // Mission mission;
  // int userId;
  // bool isCompleted;

  WeeklyPointWidget({
    Key? key,
    // required this.mission,
    // required this.userId,
    // required this.isCompleted,
  }) : super(key: key);

  @override
  WeeklyPointWidgetState createState() => WeeklyPointWidgetState();
}

class WeeklyPointWidgetState extends State<WeeklyPointWidget> {
  final _biggerFont =
      const TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold);
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

  @override
  Widget build(BuildContext context) {
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
                    width: 350.0,
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
                              // utils.convertStringToUnicode(widget.mission.emoji) +
                              //     widget.mission.label,
                              "Weekly Point", style: _biggerFont,
                              textAlign: TextAlign.center,
                            ),
                            Text('\u{1F331} 5')
                          ]),
                      Container(
                          height: 60,
                          margin: EdgeInsets.only(top: 10),
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                return Container(
                                    child: Column(children: [
                                  Text("Mon"),
                                  Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.purple),
                                      width: 40,
                                      height: 40,
                                      child: Text("24"))
                                ]));
                              },
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (_, index) {
                                return Container(width: 7);
                              },
                              itemCount: 7)
                          // ],
                          ),
                      // )
                    ])))));
  }
}
