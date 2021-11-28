import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/completed_mission/completed_mission_cubit.dart';
import 'package:tickley/src/bloc/completed_mission/completed_mission_state.dart';
import 'package:tickley/src/model/completed_mission/completed_mission.dart';
import 'package:tickley/src/model/tUser/tUser.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/widget_functions.dart';
import 'package:tickley/src/widgets/completed_mission_widget.dart';
import 'package:tickley/src/widgets/new_mission_form_widget.dart';

class SuggetMissionScreen extends StatefulWidget {



  SuggetMissionScreen({Key? key}) : super(key: key);

  @override
  HistoryScreenState createState() => HistoryScreenState();
}

class HistoryScreenState extends State<SuggetMissionScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('미션 제안하기'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: NewMissionFormWidget()
    );
  }
}
