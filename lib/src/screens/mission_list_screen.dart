import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/favorite_missions/favorite_mission_cubit.dart';
import 'package:tickley/src/bloc/favorite_missions/favorite_mission_state.dart';

import 'package:tickley/src/model/tUser/tUser.dart';
import 'package:tickley/src/widgets/checklist_widget.dart';
import 'package:tickley/src/utils/widget_functions.dart';
import 'mission_select_screen.dart';

class MissionListScreen extends StatefulWidget {
  TUser tUser;
  MissionListScreen({Key? key, required this.tUser}) : super(key: key);

  @override
  MissionListScreenState createState() => MissionListScreenState();
}

class MissionListScreenState extends State<MissionListScreen> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _biggerBoldFont =
      const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700);

  @override
  void initState() {
    super.initState();

    BlocProvider.of<FavoriteMissionCubit>(context)
        .fetchFavoriteMissionsByUser(widget.tUser.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                child: Column(
      children: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 55),
            child: Text(
              '오늘의 미션',
              style: _biggerBoldFont,
            )),
        _todayTask(),
        _taskSelectNavigateButton(),
      ],
    ))));
  }

  Widget _todayTask() {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      // color: Colors.white,
      height: 450.0,
      child: Column(
        // crossAxisAlignment: ,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BlocBuilder<FavoriteMissionCubit, FavoriteMissionState>(
              builder: (_, state) {
            if (state is Empty) {
              return CustomCircularProgressIndicator();
            } else if (state is Loading) {
              return CustomCircularProgressIndicator();
            } else if (state is Error) {
              return CustomCircularProgressIndicator();
            } else if (state is Loaded) {
              return Expanded(
                  child: ListView.separated(
                      itemCount: state.missions.length,
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, i) {
                        return FavoriteMissionListWidget(
                            mission: state.missions[i],
                            userId: widget.tUser.id,
                            isCompleted: state.missions[i].completed);
                      },
                      separatorBuilder: (context, i) {
                        return const Divider();
                      }));
            }
            return Container();
          })
        ],
      ),
    );
  }

  Widget _taskSelectNavigateButton() {
    return (Container(
        child: Column(children: [
      Material(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        elevation: 2,
        color: Colors.white,
        child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MissionSelectScreen(tUser: widget.tUser)));
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              padding: const EdgeInsets.all(8),
              child: Text('활동 추가하기', style: _biggerBoldFont),
            )),
      ),
    ])));
  }
}
