import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/tUserCubit.dart';
import 'package:tickley/src/bloc/tUserState.dart';
import 'package:tickley/src/repository/tUserRepository.dart';
import 'package:tickley/src/screens/login.dart';
import 'src/bottomNavigator.dart';

class TickelyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '티끌리',
      home: Tickely(),
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}

class Tickely extends StatefulWidget {
  TickelyState createState() => TickelyState();
}

class TickelyState extends State<Tickely> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => TUserCubit(repository: TUserRepository()))
    ], child: TickleyWidget());
  }
}

// TODO: tickleywidget 만들기
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
        return Login(initLoad: false);
      } else if (state is Error) {
        return Login(initLoad: false);
      } else if (state is Loading) {
        return Login(initLoad: true);
      } else if (state is Loaded) {
        return BottomNavigator();
      }
      return Container();
    });
  }
}
