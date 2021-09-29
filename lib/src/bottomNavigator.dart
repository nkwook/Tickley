import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/today.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({Key? key, this.name}) : super(key: key);
  // TabsState createState() => TabsState();
  final name;

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = [
      Home(),
      Today(),
      Placeholder(),
    ];

    return DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text(name + ' 님'),
            ),
            bottomNavigationBar: TabBar(
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
