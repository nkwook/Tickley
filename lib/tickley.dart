import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/tUser/tUser_cubit.dart';
import 'package:tickley/src/bloc/tUser/tUser_state.dart';
import 'package:tickley/src/repository/tUser_repository.dart';
import 'package:tickley/src/screens/login_screen.dart';
import 'src/bottom_navigator.dart';

class TickleyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '티끌리',
      home: Tickley(),
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}

class Tickley extends StatefulWidget {
  TickleyState createState() => TickleyState();
}

class TickleyState extends State<Tickley> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => TUserCubit(repository: TUserRepository()))
    ], child: TickleyWidget());
  }
}

class TickleyWidget extends StatefulWidget {
  @override
  _TickleyWidgetState createState() => _TickleyWidgetState();
}

class _TickleyWidgetState extends State<TickleyWidget> {
  @override
  void initState() {
    BlocProvider.of<TUserCubit>(context).userLogin();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TUserCubit, TUserState>(builder: (_, state) {
      if (state is Empty) {
        return LoginScreen(initLoad: false);
      } else if (state is Error) {
        return LoginScreen(initLoad: false);
      } else if (state is Loading) {
        return LoginScreen(initLoad: true);
      } else if (state is Loaded) {
        return BottomNavigator();
      }
      return Container();
    });
  }
}
