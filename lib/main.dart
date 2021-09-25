import 'package:flutter/material.dart';
import 'src/home.dart';
import 'src/today.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '티끌리',
      home: BottomNavigator(),
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
    );
  }
}

class BottomNavigator extends StatelessWidget {
  // TabsState createState() => TabsState();
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
              title: Text('티끌리'),
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
