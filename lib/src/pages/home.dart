import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
// import '../widgets/taskWidget.dart';
import '../widgets/mainTaskWidget.dart';

import '../model/task.dart';
import '../model/category.dart';
import '../api/api.dart';
import './task_select.dart';
import 'dart:developer';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late Future<List<Category>> categories;
  int userId = 1; //temp
  late List<Task> tasks = [];
  late List<List<Task>> tasksList = [];
  late List<int> points = [];

  final List<String> imageList = [
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.apple.com%2Fkr%2Fshop%2Fbuy-iphone%2Fiphone-11&psig=AOvVaw3Cjux8T5Onz_Bz1hFO2W6s&ust=1633179901602000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLj34rGjqfMCFQAAAAAdAAAAABAD",
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.apple.com%2Fkr%2Fnewsroom%2F2017%2F11%2Fiphone-x-arrives-in-south-korea-thailand-turkey-and-10-more-countries%2F&psig=AOvVaw0MufQkYq8FxZCw0Cm28SpL&ust=1633179925035000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMiZpL2jqfMCFQAAAAAdAAAAABAD",
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fswappie.com%2Fno-en%2Fmodel%2Fiphone-8-plus%2F&psig=AOvVaw34ev0zcm1dW8-imG_UcpTV&ust=1633179937766000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMCQiMOjqfMCFQAAAAAdAAAAABAD"
  ];

  @override
  void initState() {
    super.initState();
    categories = fetchCategories();
    for (var i = 1; i <= 4; i++) {
      //categories 4개로 고정
      updateTasks(i); // category별로 task 업뎃
    }
    print("taskList >>>---");
    print(tasksList);
    print("global point >>>---");
    print(points);
  }

  //Category별로 task 업뎃
  void updateTasks(int id) async {
    List<Task> t = await fetchTasksByCategory(id);
    int globalPoint = await fetchCategoryPointSum(id);
    print(globalPoint);
    setState(() {
      //tasks = t;
      tasksList.add(t);
      //points.add(globalPoint);
      print("taskList >>>");
      print(t);
      print("global point >>>");
      //print(globalPoint);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
        future: categories,
        builder: (context, snapshot) {
          return
              // Expanded(
              // child:
              snapshot.hasData
                  ? CategorySlider(
                      categories: snapshot.data!,
                      currentCategory: 0,
                      tasksList: tasksList,
                    )
                  : Center(child: CircularProgressIndicator());
        });
  }
}

class CategorySlider extends StatelessWidget {
  final List<Category> categories;
  int currentCategory = 0;
  final List<List<Task>> tasksList;

  final List<List<String>> titleList = [
    ["다같이 전구를", "시간 끈 것과 같아요!"], //전기
    ["욕조", "개에 들어갈 만큼의 물을 아꼈네요 :)"], //물
    ["바다에 갈뻔한 일반 쓰레기", "톤을 줄였어요!"], //쓰레기
    ["숲에 나무를", "그루 심은 것과 같은 탄소줄이기에요"], //이산화탄소
  ];
  final List<String> valueList = [
    "1000",
    "1200",
    "1203",
    "301",
  ];

  final List<String> illustList = [
    "assets/illust3.png",
    "assets/illust2.png",
    "assets/illust1.png",
    "assets/tree.png",
  ];

  CategorySlider(
      {Key? key,
      required this.categories,
      required this.currentCategory,
      required this.tasksList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(categories);
    final double height = MediaQuery.of(context).size.height;
    return CarouselSlider(
        options: CarouselOptions(
          enableInfiniteScroll: false,
          height: height,
          viewportFraction: 1.0,
          enlargeCenterPage: false,
          autoPlay: true,
        ),
        items: categories
            .map((e) => ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Stack(fit: StackFit.expand, children: [
                  Column(children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      child: Container(
                          margin: EdgeInsets.all(20),
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                  children: <TextSpan>[
                                TextSpan(text: titleList[e.id - 1][0] + "\n"),
                                TextSpan(
                                    text: valueList[e.id - 1],
                                    style: TextStyle(color: Colors.green)),
                                TextSpan(text: titleList[e.id - 1][1]),
                              ]))),
                    ),
                    SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset(illustList[e.id - 1])),
                    Container(
                        margin: EdgeInsets.all(20),
                        child: TaskList2(tasks: tasksList[e.id - 1])),
                  ]),
                ])))
            .toList());
  }
}

class TaskList2 extends StatefulWidget {
  final List<Task> tasks;

  TaskList2({Key? key, required this.tasks}) : super(key: key);
  TaskListState2 createState() => TaskListState2();
}

class TaskListState2 extends State<TaskList2> {
  @override
  Widget build(BuildContext context) {
    print(widget.tasks.length);
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Container(height: 10);
      },
      shrinkWrap: true,
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        // return Text("Td");
        return MainTaskWidget(task: widget.tasks[index]);
      },
    );
  }
}

// class MaskedImage extends StatelessWidget {
//   final String asset;
//   final String mask;

//   MaskedImage({@required this.asset, @required this.mask});

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(builder: (context, constraints) {
//       return FutureBuilder<List>(
//         future: _createShaderAndImage(asset, mask, constraints.maxWidth, constraints.maxHeight),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) return const SizedBox.shrink();
//           return ShaderMask(
//             blendMode: BlendMode.dstATop,
//             shaderCallback: (rect) => snapshot.data[0],
//             child: snapshot.data[1],
//           );
//         },
//       );
//     });
//   }
