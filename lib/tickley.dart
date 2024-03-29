import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/auth/auth_cubit.dart';
import 'package:tickley/src/bloc/auth/auth_state.dart';
import 'package:tickley/src/bloc/category/category_cubit.dart';
import 'package:tickley/src/bloc/category_point/category_point_cubit.dart';
import 'package:tickley/src/bloc/completed_mission/completed_mission_cubit.dart';
import 'package:tickley/src/bloc/favorite_mission/favorite_mission_cubit.dart';
import 'package:tickley/src/bloc/mission/mission_cubit.dart';
import 'package:tickley/src/bloc/mission_user/mission_user_cubit.dart';
import 'package:tickley/src/bloc/most_active_mission/most_active_mission_cubit.dart';
import 'package:tickley/src/bloc/point/point_cubit.dart';
import 'package:tickley/src/bloc/popular_mission/popular_mission_cubit.dart';
import 'package:tickley/src/bloc/suggestion/suggest_mission_cubit.dart';
import 'package:tickley/src/bloc/tUser/tUser_cubit.dart';
import 'package:tickley/src/bloc/weekly_completed_mission/weekly_completed_mission_cubit.dart';

import 'package:tickley/src/repository/category_repository.dart';
import 'package:tickley/src/repository/completed_mission_repository.dart';
import 'package:tickley/src/repository/favorite_mission_repository.dart';
import 'package:tickley/src/repository/mission_repository.dart';
import 'package:tickley/src/repository/mission_user_repository.dart';
import 'package:tickley/src/repository/most_active_mission_repostitory.dart';
import 'package:tickley/src/repository/point_repository.dart';
import 'package:tickley/src/repository/tUser_repository.dart';
import 'package:tickley/src/screens/login_screen.dart';
import 'package:tickley/src/screens/register_screen.dart';

import 'src/bottom_navigator.dart';

class TickleyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          //TODO: separate unrequired global blocproviders.
          BlocProvider(create: (_) => AuthCubit(repository: TUserRepository())),
          BlocProvider(
              create: (_) => TUserCubit(
                  tUserRepository: TUserRepository(),
                  pointRepository: PointRepository())),
          BlocProvider(
              create: (_) => FavoriteMissionCubit(
                  repository: FavoriteMissionRepository())),
          BlocProvider(
              create: (_) => CategoryCubit(repository: CategoryRepository())),
          BlocProvider(
              create: (_) => MissionCubit(repository: MissionRepository())),
          BlocProvider(
              create: (_) => CompletedMissionCubit(
                  repository: CompletedMissionRepository())),
          BlocProvider(
              create: (_) => WeeklyCompletedMissionCubit(
                  repository: CompletedMissionRepository())),
          BlocProvider(
              create: (_) => PointCubit(repository: PointRepository())),
          BlocProvider(
              create: (_) => MostActiveMissionCubit(
                  repository: MostActiveMissionRepository())),
          BlocProvider(
            create: (_) =>
                MissionUserCubit(repository: MissionUserRepository()),
          ),
          BlocProvider(
            create: (_) => CategoryPointCubit(repository: PointRepository()),
          ),
          BlocProvider(
            create: (_) => SuggestMissionCubit(repository: MissionRepository()),
          ),
          BlocProvider(
            create: (_) => PopularMissionCubit(repository: MissionRepository()),
          ),
        ],
        child: MaterialApp(
            title: '티끌이',
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
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      BlocProvider.of<AuthCubit>(context).userLogin(user.uid);
    }
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
      } else if (state is Register) {
        return RegisterScreen();
      } else if (state is Loaded) {
        return BottomNavigator(tUser: state.tUser);
      }
      return Container();
    });
  }
}
