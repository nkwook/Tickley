import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/category/category_cubit.dart';
import 'package:tickley/src/bloc/category/category_state.dart' as cs;
import 'package:tickley/src/bloc/favorite_missions/favorite_mission_cubit.dart';
import 'package:tickley/src/bloc/favorite_missions/favorite_mission_state.dart';
import 'package:tickley/src/bloc/mission/mission_cubit.dart';
import 'package:tickley/src/bloc/mission/mission_state.dart' as ms;
import 'package:tickley/src/model/category/category.dart';
import 'package:tickley/src/model/mission/mission.dart';
import 'package:tickley/src/model/tUser/tUser.dart';

import 'package:tickley/src/utils/widget_functions.dart';
import '../widgets/mission_widget.dart';
import '../widgets/category_widget.dart';

class MissionSelectScreen extends StatefulWidget {
  TUser tUser;
  MissionSelectScreen({Key? key, required this.tUser}) : super(key: key);
  @override
  MissionSelectScreenState createState() => MissionSelectScreenState();
}

class MissionSelectScreenState extends State<MissionSelectScreen> {
  int userId = 0;
  int currentCategory = 1;

  final _biggerGreyFont = const TextStyle(fontSize: 18.0, color: Colors.grey);
  final _biggerFont =
      const TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700);

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryCubit>(context).fetchCategories();
    BlocProvider.of<MissionCubit>(context).fetchMissionsByCategory(1);
  }

  void updateCurrentCategory(int id) async {
    setState(() {
      currentCategory = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        //  Scaffold(
        //     appBar: AppBar(
        //       title: Text('Add Mission'),
        //       backgroundColor: Colors.white,
        //       foregroundColor: Colors.black,
        //     ),
        //     body:
        Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(25.0),
                    topRight: const Radius.circular(25.0))),
            child: SingleChildScrollView(child:
                BlocBuilder<CategoryCubit, cs.CategoryState>(
                    builder: (_, state) {
              if (state is cs.Empty) {
                return Center(child: CustomCircularProgressIndicator());
              } else if (state is cs.Error) {
                return Center(child: CustomCircularProgressIndicator());
              } else if (state is cs.Loading) {
                return Center(child: CustomCircularProgressIndicator());
              } else if (state is cs.Loaded) {
                return Center(
                    heightFactor: 1,
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          "Add Mission",
                          style: _biggerFont,
                        ),
                      ),
                      Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          height: 70,
                          child: CategoryList(
                              categories: state.categories,
                              updateCurrentCategory: updateCurrentCategory,
                              currentCategory: currentCategory)),
                      Divider(),
                      Container(
                          margin: EdgeInsets.only(top: 5, bottom: 15),
                          child: Text('관심있는 활동들을 눌러서 확인해보세요',
                              textAlign: TextAlign.center,
                              style: _biggerGreyFont)),
                      BlocBuilder<MissionCubit, ms.MissionState>(
                          builder: (_, missionState) {
                        if (missionState is ms.Empty) {
                          return Center(
                              child: CustomCircularProgressIndicator());
                        } else if (missionState is ms.Error) {
                          return Center(
                              child: CustomCircularProgressIndicator());
                        } else if (missionState is ms.Loading) {
                          return Center(
                              child: CustomCircularProgressIndicator());
                        } else if (missionState is ms.Loaded) {
                          return Container(
                              height: MediaQuery.of(context).size.height * 0.55,
                              width: 200,
                              child: MissionList(
                                missions: missionState.missions,
                                userId: widget.tUser.id,
                              ));
                        }
                        return Container();
                      })
                    ]));
              }
              return Container();
            })));
  }
}

class CategoryList extends StatelessWidget {
  final List<Category> categories;
  final ValueChanged<int> updateCurrentCategory;

  int currentCategory;

  CategoryList(
      {Key? key,
      required this.categories,
      required this.updateCurrentCategory,
      required this.currentCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Container(width: 20);
      },
      padding: EdgeInsets.only(top: 8.0),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryWidget(
            label: categories[index].label,
            emoji: categories[index].emoji,
            id: categories[index].id,
            updateCurrentCategory: updateCurrentCategory,
            currentCategory: currentCategory);
      },
    );
  }
}

class MissionList extends StatefulWidget {
  final List<Mission> missions;
  int userId;

  MissionList({
    Key? key,
    required this.missions,
    required this.userId,
  }) : super(key: key);
  MissionListState createState() => MissionListState();
}

class MissionListState extends State<MissionList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteMissionCubit, FavoriteMissionState>(
        builder: (_, state) {
      if (state is Empty)
        return CustomCircularProgressIndicator();
      else if (state is Loading)
        return CustomCircularProgressIndicator();
      else if (state is Error)
        return CustomCircularProgressIndicator();
      else if (state is Loaded) {
        return ListView.separated(
          separatorBuilder: (context, index) {
            return Container(height: 10);
          },
          shrinkWrap: true,
          itemCount: widget.missions.length,
          itemBuilder: (context, index) {
            bool isFavorite = false;
            for (int i = 0; i < state.missions.length; i++) {
              if (state.missions[i].id == widget.missions[index].id) {
                isFavorite = true;
                break;
              }
            }

            return MissionWidget(
              mission: widget.missions[index],
              userId: widget.userId,
              isFavorite: isFavorite,
            );
          },
        );
      }

      return Container();
    });
  }
}
