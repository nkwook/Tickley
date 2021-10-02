import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
// import '../widgets/taskWidget.dart';
import '../widgets/mainTaskWidget.dart';
import '../model/user.dart';
import '../model/task.dart';
import '../model/category.dart';
import '../api/api.dart';
import './taskSelect.dart';
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
      updateTasks(i);
    }
    print(tasksList);
  }

  void updateTasks(int id) async {
    List<Task> t = await fetchTasksByCategory(id);
    setState(() {
      //tasks = t;
      tasksList.add(t);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
        future: categories,
        builder: (context, snapshot) {
          return snapshot.hasData
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

  final List<String> missionList = [
    "다같이 전구를 00시간 끈 것과 같아요!",
    "1.5L 페트병 000개 만큼의 물을 아꼈습니다~",
    "쓰레기 ㅇㅇ톤을 줄였어요!",
    "나무를 ㅇㅇ 그루 심은 것과 같은 효과에요!",
  ];

  final List<String> illustList = [
    "assets/lightbulb.jpg",
    "assets/plastic.jpg",
    "assets/trash.jpg",
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
                  Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        child: 
                        Container(
                          margin: EdgeInsets.all(20),
                          child:Text(
                          missionList[e.id - 1],
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),),
                        
                      ),
                      SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.asset(illustList[e.id - 1])),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: TaskList2(tasks: tasksList[0])
                      ),
                    ],
                  ),
                ]),
              ))
          .toList(),
    );
  }
}

class TaskList2 extends StatefulWidget {
  final List<Task> tasks;

  TaskList2({Key? key, required this.tasks})
      : super(key: key);
  TaskListState2 createState() => TaskListState2();
}

class TaskListState2 extends State<TaskList2> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Container(height: 10);
      },
      shrinkWrap: true,
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return MainTaskWidget(task: widget.tasks[index], usersId: [1,2]);
      },
    );
  }
}


// class UserList extends StatelessWidget {
//   final String category;
//   final ValueChanged<int> updateTasks;
//   int currentCategory;

//   UserList(
//       {Key? key,
//       required this.category,
//       required this.updateTasks,
//       required this.currentCategory})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       separatorBuilder: (context, index) {
//         return Container(width: 20);
//       },
//       padding: EdgeInsets.only(top: 8.0),
//       scrollDirection: Axis.horizontal,
//       shrinkWrap: true,
//       itemCount: categories.length,
//       itemBuilder: (context, index) {
//         return UserWidget(
//             id: categories[index].id,
//             nickname: categories[index].nickname,
//             profile_image: categories[index].profile_image,
//             id: categories[index].id,
//           );
//       },
//     );
//   }
// }


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

//   Future<List> _createShaderAndImage(String asset, String mask, double w, double h) async {
//     ByteData data = await rootBundle.load(asset);
//     ByteData maskData = await rootBundle.load(mask);

//     Codec codec = await instantiateImageCodec(maskData.buffer.asUint8List(), targetWidth: w.toInt(), targetHeight: h.toInt());
//     FrameInfo fi = await codec.getNextFrame();

//     ImageShader shader = ImageShader(fi.image, TileMode.clamp, TileMode.clamp, Matrix4.identity().storage);
//     Image image = Image.memory(data.buffer.asUint8List(), fit: BoxFit.cover, width: w, height: h);
//     return [shader, image];
//   }
// }
