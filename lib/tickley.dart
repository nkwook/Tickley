import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/auth/auth_cubit.dart';
import 'package:tickley/src/bloc/auth/auth_state.dart';
import 'package:tickley/src/bloc/category/category_cubit.dart';
import 'package:tickley/src/bloc/completed_mission/completed_mission_cubit.dart';
import 'package:tickley/src/bloc/favorite_missions/favorite_mission_cubit.dart';
import 'package:tickley/src/bloc/mission/mission_cubit.dart';
import 'package:tickley/src/bloc/tUser/tUser_cubit.dart';

import 'package:tickley/src/repository/category_repository.dart';
import 'package:tickley/src/repository/completed_mission_repository.dart';
import 'package:tickley/src/repository/favorite_mission_repository.dart';
import 'package:tickley/src/repository/mission_repository.dart';
import 'package:tickley/src/repository/tUser_repository.dart';
import 'package:tickley/src/screens/login_screen.dart';
import 'src/bottom_navigator.dart';

class TickleyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AuthCubit(repository: TUserRepository())),
          BlocProvider(
              create: (_) => TUserCubit(repository: TUserRepository())),
          BlocProvider(
              create: (_) => FavoriteMissionCubit(
                  repository: FavoriteMissionRepository())),
          BlocProvider(
              create: (_) => CategoryCubit(repository: CategoryRepository())),
          BlocProvider(
              create: (_) => MissionCubit(repository: MissionRepository())),
          BlocProvider(
              create: (_) => CompletedMissionCubit(
                  repository: CompletedMissionRepository()))
        ],
        child: MaterialApp(
            title: '티끌리',
            home: Tickley(),
            theme: new ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primaryColor: Colors.white,
            )));
  }
}

class Tickley extends StatefulWidget {
  TickleyState createState() => TickleyState();
}

class TickleyState extends State<Tickley> {
  @override
  void initState() {
    BlocProvider.of<AuthCubit>(context).userLogin();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (_, state) {
      if (state is Empty) {
        return LoginScreen(initLoad: false);
      } else if (state is Error) {
        return LoginScreen(initLoad: false);
      } else if (state is Loading) {
        return LoginScreen(initLoad: true);
      } else if (state is Loaded) {
        return BottomNavigator(tUser: state.tUser);
      }
      return Container();
    });
  }
}
