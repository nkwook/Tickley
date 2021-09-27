import 'package:flutter/material.dart';

import 'home.dart';
import 'today.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({Key? key, required this.name}) : super(key: key);
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
                  icon: Icon(Icons.nature),
                  height: 120,
                ),
                Tab(
                  icon: Icon(Icons.nature),
                ),
                Tab(
                  icon: Icon(Icons.settings),
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
