import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/mission/mission_cubit.dart';
import 'package:tickley/src/bloc/most_active_mission/most_active_mission_cubit.dart';
import 'package:tickley/src/bloc/most_active_mission/most_active_mission_state.dart'
    as ms;

import 'package:tickley/src/bloc/point/point_cubit.dart';
import 'package:tickley/src/bloc/point/point_state.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/widget_functions.dart';
import 'package:tickley/src/widgets/all_user_point_widget.dart';
import 'package:tickley/src/widgets/category_chart_widget.dart';
import 'package:tickley/src/widgets/most_active_mission_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final fixedList = [0, 1, 2];
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PointCubit>(context).fetchAllUserPoint();
    BlocProvider.of<MostActiveMissionCubit>(context).fetchMostActiveMissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
          BlocBuilder<PointCubit, PointState>(builder: (_, state) {
            if (state is Empty) {
              return CustomCircularProgressIndicator();
            } else if (state is Loading) {
              return CustomCircularProgressIndicator();
            } else if (state is Error) {
              return CustomCircularProgressIndicator();
            } else if (state is Loaded) {
              return AllUserPointWidget(
                point: state.point,
                userLength: state.userLength,
              );
            }
            return Container();
          }),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 30, bottom: 5),
              padding: EdgeInsets.only(left: 25),
              child: Column(children: [
                Text(
                  '가장 인기있는 미션',
                  style: BiggerFont22,
                )
              ])),
          BlocBuilder<MostActiveMissionCubit, ms.MostActiveMissionState>(
              builder: (_, state) {
            if (state is ms.Empty)
              return CustomCircularProgressIndicator();
            else if (state is ms.Loading)
              return CustomCircularProgressIndicator();
            else if (state is ms.Error)
              return CustomCircularProgressIndicator();
            else if (state is ms.Loaded) {
              return MostActiveMissionWidget(mission: state.missions);
              // return CarouselSlider(
              //     options: CarouselOptions(
              //       enableInfiniteScroll: false,
              //       height: 170,
              //       viewportFraction: 1.0,
              //       enlargeCenterPage: false,
              //       autoPlay: true,
              //     ),
              //     items: state.missions
              //         .map((mission) =>
              //             MostActiveMissionWidget(mission: mission))
              //         .toList());
            }
            return Container();
          }),
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 30, bottom: 0),
              padding: EdgeInsets.only(left: 25),
              child: Text(
                '카테고리별 저감량',
                style: BiggerFont22,
              )),
          CategoryChartWidget()
        ])));
  }
}
