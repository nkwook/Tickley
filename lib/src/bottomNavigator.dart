import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/today.dart';

class BottomNavigator extends StatefulWidget {
  BottomNavigatorState createState() => BottomNavigatorState();
}

class BottomNavigatorState extends State<BottomNavigator> {
  String _title = 'Today';
  int _currentIndex = 1;
  User? user;
  // const BottomNavigatorState({Key? key}) : super(key: key);
  // TabsState createState() => TabsState();
  @override
  void initState() {
    // TODO: implement initState
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
      Today(user: user),
      Placeholder(),
    ];

    void onTabTapped(int index) {
      //보류
      setState(() {
        _currentIndex = index;
        switch (index) {
          case 0:
            {
              _title = 'Home';
            }
            break;
          case 1:
            {
              _title = 'Today';
            }
            break;
          case 2:
            {
              _title = 'MyPage';
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
