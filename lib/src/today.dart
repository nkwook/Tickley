import 'package:flutter/material.dart';
import 'package:tickley/src/todayCategoryModal.dart';

class Today extends StatefulWidget {
  @override
  TodayState createState() => TodayState();
}

class TodayState extends State<Today> {
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _todayTasks = ['텀블러 사용 하기', '자가용 대신 대중교통', '일회용 수저 주문 안 하기'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _today(),
    );
  }

  Widget _today() {
    return Center(
        child: SingleChildScrollView(
            child: Column(
      children: <Widget>[
        _todayTask(),
        // Text('srs'),
        _categoryTask()
        // Text('rr')
      ],
    )));
  }

  Widget _todayTask() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      // color: Colors.white,
      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      height: 300.0,
      child: Column(
        children: [
          Text('당신에게 주어진 오늘의 태스크'),
          // _todayTakeList(),
          Expanded(
              child: ListView.separated(
                  itemCount: _todayTasks.length,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, i) {
                    return _buildRow(_todayTasks[i]);
                  },
                  separatorBuilder: (context, i) {
                    return const Divider();
                  }))
        ],
      ),
    );
  }

  Widget _buildRow(String task) {
    return ListTile(
      title: Text(
        task,
        style: _biggerFont,
      ),
    );
  }

  Widget _categoryTask() {
    const temp = '에너지 절약';
    return (Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        // color: Colors.red,
        decoration: BoxDecoration(border: Border.all(color: Colors.redAccent)),
        height: 400.0,
        child: Column(children: [
          Text('카테고리로 찾기'),
          Expanded(
              child: CustomScrollView(
            primary: false,
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverGrid.count(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: <Widget>[
                    Material(
                      color: Colors.green[100],
                      child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return TodayCategoryModal(temp: temp);
                                });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('에너지 절약'),
                          )),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('쓰레기 절감'),
                      color: Colors.green[200],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('온실가스 저감'),
                      color: Colors.green[300],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('환경보호 봉사 활동'),
                      color: Colors.green[400],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('생태계 보호'),
                      color: Colors.green[500],
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Text('친환경 제품 이용'),
                      color: Colors.green[600],
                    ),
                  ],
                ),
              ),
            ],
          ))
        ])));
  }
}
