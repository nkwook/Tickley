import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/favorite_mission/favorite_mission_cubit.dart';
import 'package:tickley/src/model/mission/mission.dart';
import 'package:tickley/src/utils/utils.dart';

class MissionWidget extends StatefulWidget {
  Mission mission;
  int userId;
  bool isFavorite;

  MissionWidget({
    Key? key,
    required this.mission,
    required this.userId,
    required this.isFavorite,
  }) : super(key: key);

  @override
  MissionWidgetState createState() => MissionWidgetState();
}

class MissionWidgetState extends State<MissionWidget> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  Utils utils = new Utils();
  bool isFavorite = false;
  bool clicked = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isFavorite = widget.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!clicked) {
      setState(() {
        isFavorite = widget.isFavorite;
      });
    }
    return Container(
        child: Material(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            elevation: 2,
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              onTap: () {
                if (!isFavorite) {
                  BlocProvider.of<FavoriteMissionCubit>(context)
                      .addFavoriteMission(widget.userId, widget.mission.id);
                  setState(() {
                    clicked = true;
                    isFavorite = true;
                  });
                  //need to check status
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('체크리스트에 추가되었습니다.')));
                } else {
                  BlocProvider.of<FavoriteMissionCubit>(context)
                      .deleteFavoriteMission(widget.userId, widget.mission.id);

                  setState(() {
                    clicked = true;
                    isFavorite = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('체크리스트에서 삭제되었습니다.')));
                }
              },
              child: Container(
                  decoration: BoxDecoration(
                    color: isFavorite ? Colors.grey : Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.black),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    utils.convertStringToUnicode(widget.mission.emoji) +
                        widget.mission.label,
                    style: _biggerFont,
                    textAlign: TextAlign.center,
                  )),
            )));
  }
}
