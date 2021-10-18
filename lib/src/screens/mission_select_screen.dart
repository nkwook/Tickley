import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/category/category_cubit.dart';
import 'package:tickley/src/bloc/category/category_state.dart' as cs;
import 'package:tickley/src/bloc/favorite_missions/favorite_mission_cubit.dart';
import 'package:tickley/src/bloc/missions/mission_cubit.dart';
import 'package:tickley/src/bloc/missions/mission_state.dart' as ms;
import 'package:tickley/src/bloc/tUser/tUser_cubit.dart';
import 'package:tickley/src/bloc/tUser/tUser_state.dart' as ts;
import 'package:tickley/src/model/category/category.dart';
import 'package:tickley/src/model/mission/mission.dart';
import 'package:tickley/src/model/tUser/tUser.dart';
import 'package:tickley/src/repository/category_repository.dart';
import 'package:tickley/src/repository/favorite_mission_repository.dart';
import 'package:tickley/src/repository/mission_repository.dart';
import 'package:tickley/src/repository/tUser_repository.dart';

import 'package:tickley/src/utils/widget_functions.dart';
import 'package:tickley/tickley.dart';
import '../widgets/task_widget.dart';
import '../widgets/category_widget.dart';
import '../model/task.dart';

import '../api/api.dart';

class MissionSelect extends StatefulWidget {
  Function updateToday;

  MissionSelect({Key? key, required this.updateToday}) : super(key: key);
  @override
  MissionSelectState createState() => MissionSelectState();
}

class MissionSelectState extends State<MissionSelect> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      // BlocProvider(create: (_) => TUserCubit(repository: TUserRepository())),
      BlocProvider(
          create: (_) =>
              FavoriteMissionCubit(repository: FavoriteMissionRepository())),
      BlocProvider(
          create: (_) => CategoryCubit(repository: CategoryRepository())),
      BlocProvider(
          create: (_) => MissionCubit(repository: MissionRepository())),
    ], child: MissionSelectWidget(updateToday: widget.updateToday));
  }
}

class MissionSelectWidget extends StatefulWidget {
  Function updateToday;
  MissionSelectWidget({Key? key, required this.updateToday}) : super(key: key);

  MissionSelectWidgetState createState() => MissionSelectWidgetState();
}

class MissionSelectWidgetState extends State<MissionSelectWidget> {
  late List<Task> tasks = [];
  late List<Task> favoriteTasks = [];
  int userId = 0;
  int currentCategory = 1;

  final _biggerGreyFont = const TextStyle(fontSize: 18.0, color: Colors.grey);

  _updateUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        TUser tUser = await userLogin(user.uid);
        if (tUser.accessToken == user.uid) {
          int id = tUser.id;
          setState(() {
            userId = id;
          });
          updateFavoriteTasks(id);
        }
      } catch (error) {}
    }
  }

  @override
  void initState() {
    super.initState();
    _updateUser();
    // BlocProvider.of<FavoriteMissionCubit>(context).fetchFavoriteMissionsByUser(
    // print(BlocProvider.of<TUserCubit>(context).state.tUserState.toString());
    // // BlocProvider.value(value: )
    // print(BlocProvider.of<TUserCubit>(context).state.toString());
    BlocProvider.of<CategoryCubit>(context).fetchCategories();
    BlocProvider.of<MissionCubit>(context).fetchMissionsByCategory(1);
  }

  void updateCurrentCategory(int id) async {
    setState(() {
      currentCategory = id;
    });
  }

  void updateFavoriteTasks(int id) async {
    List<Task> t = await fetchFavoriteTasksByUser(id);
    setState(() {
      favoriteTasks = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('환경 보호 활동 찾기'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: BlocBuilder<CategoryCubit, cs.CategoryState>(builder: (_, state) {
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
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      height: 70,
                      child: CategoryList(
                          categories: state.categories,
                          updateCurrentCategory: updateCurrentCategory,
                          currentCategory: currentCategory)),
                  Divider(),
                  Container(
                      margin: EdgeInsets.only(top: 5, bottom: 15),
                      child: Text('관심있는 활동들을 눌러서 확인해보세요',
                          textAlign: TextAlign.center, style: _biggerGreyFont)),
                  BlocBuilder<MissionCubit, ms.MissionState>(
                      builder: (_, missionState) {
                    if (missionState is ms.Empty) {
                      return Center(child: CustomCircularProgressIndicator());
                    } else if (missionState is ms.Error) {
                      return Center(child: CustomCircularProgressIndicator());
                    } else if (missionState is ms.Loading) {
                      return Center(child: CustomCircularProgressIndicator());
                    } else if (missionState is ms.Loaded) {
                      return Container(
                          width: 200,
                          child: TaskList(
                              tasks: missionState.missions,
                              userId: userId,
                              favoriteTasks: favoriteTasks,
                              updateFavoriteTasks: updateFavoriteTasks,
                              updateToday: widget.updateToday));
                    }
                    return Container();
                  })
                ]));
          }
          return Container();
        }));
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

class TaskList extends StatefulWidget {
  final List<Mission> tasks;
  int userId;
  List<Task> favoriteTasks;
  Function(int) updateFavoriteTasks;
  Function updateToday;

  TaskList(
      {Key? key,
      required this.tasks,
      required this.userId,
      required this.favoriteTasks,
      required this.updateFavoriteTasks,
      required this.updateToday})
      : super(key: key);
  TaskListState createState() => TaskListState();
}

class TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Container(height: 10);
      },
      shrinkWrap: true,
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        bool isFavorite = false;
        for (int i = 0; i < widget.favoriteTasks.length; i++) {
          if (widget.favoriteTasks[i].id == widget.tasks[index].id) {
            isFavorite = true;
            // });
            break;
          }
        }

        return TaskWidget(
            task: widget.tasks[index],
            userId: widget.userId,
            isFavorite: isFavorite,
            favoriteTasks: widget.favoriteTasks,
            updateFavoriteTasks: widget.updateFavoriteTasks,
            updateToday: widget.updateToday);
      },
    );
  }
}
