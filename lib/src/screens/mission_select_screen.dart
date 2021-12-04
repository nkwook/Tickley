import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/category/category_cubit.dart';
import 'package:tickley/src/bloc/category/category_state.dart' as cs;
import 'package:tickley/src/bloc/favorite_mission/favorite_mission_cubit.dart';
import 'package:tickley/src/bloc/favorite_mission/favorite_mission_state.dart';
import 'package:tickley/src/bloc/mission/mission_cubit.dart';
import 'package:tickley/src/bloc/mission/mission_state.dart' as ms;
import 'package:tickley/src/model/category/category.dart';
import 'package:tickley/src/model/mission/mission.dart';
import 'package:tickley/src/model/tUser/tUser.dart';

import 'package:tickley/src/utils/constants.dart';

import 'package:tickley/src/utils/widget_functions.dart';
import 'package:tickley/src/widgets/new_mission_form_widget.dart';
import '../widgets/add_mission_list_widget.dart';
import '../widgets/category_widget.dart';

class MissionSelectScreen extends StatefulWidget {
  TUser tUser;

  MissionSelectScreen({Key? key, required this.tUser}) : super(key: key);
  @override
  MissionSelectScreenState createState() => MissionSelectScreenState();
}

class MissionSelectScreenState extends State<MissionSelectScreen> {
  int currentCategory = 1;
  bool isSuggestion = false;

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

  void setIsSuggestion() {
    setState(() {
      isSuggestion = !isSuggestion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25.0),
                topRight: const Radius.circular(25.0))),
        child: isSuggestion
            ? NewMissionFormWidget(setSuggestion: setIsSuggestion)
            : SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: BlocBuilder<CategoryCubit, cs.CategoryState>(
                    builder: (_, state) {
                  if (state is cs.Empty) {
                    return Center(child: CustomCircularProgressIndicator());
                  } else if (state is cs.Error) {
                    return Center(child: CustomCircularProgressIndicator());
                  } else if (state is cs.Loading) {
                    return Center(child: CustomCircularProgressIndicator());
                  } else if (state is cs.Loaded) {
                    return Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25, left: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "미션 추가",
                              style: TextStyle(
                                  color: COLOR_GREEN,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                                height: 48,
                                child: CategoryList(
                                    categories: state.categories,
                                    updateCurrentCategory:
                                        updateCurrentCategory,
                                    currentCategory: currentCategory)),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 20, bottom: 10),
                          child: Text('관심있는 활동들을 미션 목록에 추가해보세요',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xFFADADAD),
                                  fontWeight: FontWeight.bold))),
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
                              width: 350,
                              child: MissionList(
                                setSuggestion: setIsSuggestion,
                                missions: missionState.missions,
                                userId: widget.tUser.id,
                              ));
                        }
                        return Container();
                      })
                    ]);
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
        return Container(width: 10);
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
  Function setSuggestion;

  MissionList(
      {Key? key,
      required this.missions,
      required this.userId,
      required this.setSuggestion})
      : super(key: key);
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
        return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.6,
            ),
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return Container(height: 10);
              },
              shrinkWrap: true,
              itemCount: widget.missions.length + 1,
              itemBuilder: (context, index) {
                if (index == widget.missions.length) {
                  return GreenButton(
                      text: '새 미션 제안할래요!',
                      onTapFunction: () {
                        widget.setSuggestion();
                      });
                }

                bool isFavorite = false;
                for (int i = 0; i < state.missions.length; i++) {
                  if (state.missions[i].id == widget.missions[index].id) {
                    isFavorite = true;
                    break;
                  }
                }

                return AddMissionListWidget(
                  mission: widget.missions[index],
                  userId: widget.userId,
                  isFavorite: isFavorite,
                );
              },
            ));
      }

      return Container();
    });
  }
}
