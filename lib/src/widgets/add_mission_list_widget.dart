import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/favorite_mission/favorite_mission_cubit.dart';
import 'package:tickley/src/model/mission/mission.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/utils.dart';
import 'package:tickley/src/utils/widget_functions.dart';

class AddMissionListWidget extends StatefulWidget {
  Mission mission;
  int userId;
  bool isFavorite;

  AddMissionListWidget({
    Key? key,
    required this.mission,
    required this.userId,
    required this.isFavorite,
  }) : super(key: key);

  @override
  AddMissionListWidgetState createState() => AddMissionListWidgetState();
}

class AddMissionListWidgetState extends State<AddMissionListWidget> {
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
        width: 350,
        height: 72,
        child: Material(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            elevation: 0,
            child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(24)),
                onTap: () {
                  if (!isFavorite) {
                    BlocProvider.of<FavoriteMissionCubit>(context)
                        .addFavoriteMission(widget.userId, widget.mission.id);
                    setState(() {
                      clicked = true;
                      isFavorite = true;
                    });
                    //need to check status
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text('체크리스트에 추가되었습니다.')));
                    //  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    //         behavior: SnackBarBehavior.floating,
                    //         content: Text('체크리스트에 추가되었습니다.')));
                  } else {
                    BlocProvider.of<FavoriteMissionCubit>(context)
                        .deleteFavoriteMission(
                            widget.userId, widget.mission.id);

                    setState(() {
                      clicked = true;
                      isFavorite = false;
                    });

                    // _modelScaffoldKey.currentState!.showSnackBar(const SnackBar(
                    //     behavior: SnackBarBehavior.floating,
                    //     content: Text('체크리스트에서 삭제되었습니다.')));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text('체크리스트에서 삭제되었습니다.')));
                  }
                },
                child: Stack(children: [
                  Container(
                    // width: 350,
                      decoration: BoxDecoration(
                        color: isFavorite ? Colors.white : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        border: Border.all(color: Color(0xFFECEDEF)),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 250,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  utils.convertStringToUnicode(
                                      widget.mission.emoji) + '\t' +
                                      widget.mission.label,
                                  style: TextStyle(fontSize: 15, color: COLOR_DARK_BLUE, fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                )
                            ),
                            PointBlock(point: widget.mission.point)

                          ])
                  ),
                  Positioned(
                    top: 8,
                    left: 4,
                    child: Icon(Icons.star,
                        color: isFavorite ? COLOR_YELLOW : Colors.transparent,
                        size: 32),
                  )
                ])
            )
        )
    );
  }
}