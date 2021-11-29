import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tickley/src/bloc/completed_mission/completed_mission_cubit.dart';
import 'package:tickley/src/bloc/completed_mission/completed_mission_state.dart'
    as cs;
import 'package:tickley/src/bloc/tUser/tUser_cubit.dart';
import 'package:tickley/src/bloc/tUser/tUser_state.dart' as ts;
import 'package:tickley/src/model/completed_mission/completed_mission.dart';
import 'package:tickley/src/model/tUser/tUser.dart';
import 'package:tickley/src/screens/history_screen.dart';

import 'package:tickley/src/utils/authentication.dart';
import 'package:tickley/src/utils/constants.dart';

import 'package:tickley/src/utils/widget_functions.dart';

import 'package:tickley/src/widgets/completed_mission_widget.dart';
import 'package:tickley/src/widgets/my_category_chart_widget.dart';
import 'package:tickley/src/widgets/my_point_level_widget.dart';

class MyPageScreen extends StatefulWidget {
  TUser tUser;
  MyPageScreen({Key? key, required this.tUser}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  @override
  void initState() {
    super.initState();
    // to get points
    BlocProvider.of<TUserCubit>(context).fetchUserDataMyPage(widget.tUser.id);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 16.0),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 24, right: 25),
                  // alignment: Alignment.topLeft,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("마이페이지", style: TitleFont),
                      ])),
              BlocBuilder<TUserCubit, ts.TUserState>(builder: (_, state) {
                if (state is ts.Empty) {
                  return CustomCircularProgressIndicator();
                } else if (state is ts.Loading) {
                  return CustomCircularProgressIndicator();
                } else if (state is ts.Error) {
                  return CustomCircularProgressIndicator();
                } else if (state is ts.Loaded) {
                  return Column(children: [
                    MyPointLevelWidget(userData: state.tUser),
                    MyCategoryChartWidget(point: state.point)
                  ]);
                }
                return Container();
              }),
              GreenButton(
                  text: '내 수행 목록',
                  onTapFunction: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                HistoryScreen(tUser: widget.tUser)));
                  }),
              SizedBox(height: 15),
              _logoutButton()
            ],
          ),
        ));
  }

  Widget _logoutButton() {
    return Material(
      color: COLOR_GREY,
      elevation: 0,
      textStyle: TextStyle(
          color: COLOR_BORDER, fontSize: 18, fontWeight: FontWeight.bold),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
          onTap: () {
            Authentication.signOut(context: context);
          },
          child: Container(
              alignment: Alignment.center,
              width: 320,
              height: 50,
              child: Text('로그아웃'))),
    );
  }
}
