import 'package:flutter/material.dart';
import 'package:tickley/src/my_page.dart';
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
      MyPage(Text('세번째탭이지롱')),
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
