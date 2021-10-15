import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/today.dart';
import 'package:tickley/src/screens/my_page.dart';

class BottomNavigator extends StatefulWidget {
  BottomNavigatorState createState() => BottomNavigatorState();
}

class BottomNavigatorState extends State<BottomNavigator> {
  String _title = '티끌 리스트';
  int _currentIndex = 1;
  User? user;
  // const BottomNavigatorState({Key? key}) : super(key: key);
  // TabsState createState() => TabsState();
  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = [
      Home(),
      Today(),
      MyPage(),
    ];

    void onTabTapped(int index) {
      //보류
      setState(() {
        _currentIndex = index;
        switch (index) {
          case 0:
            {
              _title = '우리는 지금';
            }
            break;
          case 1:
            {
              _title = '티끌 리스트';
            }
            break;
          case 2:
            {
              _title = '마이페이지';
            }
            break;
        }
      });
    }

    return DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text(_title),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
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
