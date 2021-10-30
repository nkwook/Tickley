import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/category/category_cubit.dart';
import 'package:tickley/src/bloc/category/category_state.dart';
import 'package:tickley/src/model/category/category.dart';
import 'package:tickley/src/model/mission/mission.dart';

import 'package:tickley/src/utils/widget_functions.dart';

import '../widgets/main_mission_widget.dart';

import '../api/api.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoryCubit>(context).fetchCategories();
    // 변경될 여지가 많아서 mission fetch 부분 리팩토링하지 않았음.

    // for (var i = 1; i <= 4; i++) {
    //categories 4개로 고정
    // updateMissions(i); // category별로 task 업뎃
    // }
    // print("taskList >>>---");
    // print(tasksList);
    // print("global point >>>---");
    // print(points);
  }

  //Category별로 task 업뎃
  void updateMissions(int id) async {
    List<Mission> t = await fetchMissionsByCategory(id);
    int globalPoint = await fetchCategoryPointSum(id);
    // print(globalPoint);
    setState(() {
      //tasks = t;
      // missionsList.add(t);
      // print("taskList >>>");
      // print(t);
      // print("global point >>>");
      //print(globalPoint);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CategorySlider extends StatelessWidget {
  final List<Category> categories;
  int currentCategory = 0;
  final List<List<Mission>> missionsList;

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
      required this.missionsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(categories);
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
                        child: MissionList2(missions: missionsList[e.id - 1])),
                  ]),
                ])))
            .toList());
  }
}

class MissionList2 extends StatefulWidget {
  final List<Mission> missions;

  MissionList2({Key? key, required this.missions}) : super(key: key);
  MissionListState2 createState() => MissionListState2();
}

class MissionListState2 extends State<MissionList2> {
  @override
  Widget build(BuildContext context) {
    // print(widget.missions.length);
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Container(height: 10);
      },
      shrinkWrap: true,
      itemCount: widget.missions.length,
      itemBuilder: (context, index) {
        // return Text("Td");
        return index == widget.missions.length
            ? Container(height: 1)
            : MainMissionWidget(mission: widget.missions[index]);
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
