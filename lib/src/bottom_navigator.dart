import 'package:flutter/material.dart';
import 'package:tickley/src/model/tUser/tUser.dart';
import 'screens/home_screen.dart';
import 'screens/mission_list_screen.dart';
import 'package:tickley/src/screens/my_page_screen.dart';

class BottomNavigator extends StatefulWidget {
  TUser tUser;
  BottomNavigator({Key? key, required this.tUser}) : super(key: key);

  BottomNavigatorState createState() => BottomNavigatorState();
}

class BottomNavigatorState extends State<BottomNavigator> {
  // String _title = '티끌 리스트';
  int _currentIndex = 1;
  // const BottomNavigatorState({Key? key}) : super(key: key);
  // TabsState createState() => TabsState();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = [
      HomeScreen(),
      MissionListScreen(tUser: widget.tUser),
      MyPageScreen(tUser: widget.tUser),
    ];

    void onTabTapped(int index) {
      //보류
      setState(() {
        _currentIndex = index;
        // switch (index) {
        //   case 0:
        //     {
        //       _title = '우리는 지금';
        //     }
        //     break;
        //   case 1:
        //     {
        //       _title = '티끌 리스트';
        //     }
        //     break;
        //   case 2:
        //     {
        //       _title = '마이페이지';
        //     }
        //     break;
        // }
      });
    }

    return DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
            // appBar: AppBar(
            //   title: Text(_title),
            //   backgroundColor: Colors.white,
            //   foregroundColor: Colors.black,
            // ),
            bottomNavigationBar: TabBar(
              onTap: onTabTapped,
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.public),
                  height: 100,
                ),
                Tab(
                  icon: Icon(Icons.check_circle_outline),
                  height: 100,
                ),
                Tab(
                  icon: Icon(Icons.person),
                  height: 100,
                ),
              ],
              indicatorColor: Colors.transparent,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
            ),
            body: TabBarView(
              children: _widgetOptions,
            )));
  }
}
