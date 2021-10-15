import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tickley/src/model/tUser/tUser.dart';

import 'package:tickley/utils/widget_functions.dart';
import '../widgets/taskWidget.dart';
import '../widgets/categoryWidget.dart';
import '../model/task.dart';
import '../model/category.dart';
import '../api/api.dart';

class TaskSelect extends StatefulWidget {
  Function updateToday;

  TaskSelect({Key? key, required this.updateToday}) : super(key: key);

  @override
  TaskSelectState createState() => TaskSelectState();
}

class TaskSelectState extends State<TaskSelect> {
  late Future<List<Category>> categories;
  late List<Task> tasks = [];
  late List<Task> favoriteTasks = [];
  int userId = 0;
  int currentCategory = 1;

  final _biggerGreyFont = const TextStyle(fontSize: 18.0, color: Colors.grey);

  _updateUser() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        TUser tUser = await userLogin(user.uid);
        if (tUser.accessToken == user.uid) {
          int id = tUser.id;
          setState(() {
            userId = id;
          });
          updateFavoriteTasks(id);
        }
      } catch (error) {}
    }
  }

  @override
  void initState() {
    super.initState();
    _updateUser();
    // updateFavoriteTasks(userId);
    updateTasks(1);
    categories = fetchCategories();
    print(favoriteTasks);
  }

  void updateTasks(int id) async {
    List<Task> t = await fetchTasksByCategory(id);
    setState(() {
      tasks = t;
      currentCategory = id;
    });
  }

  void updateFavoriteTasks(int id) async {
    List<Task> t = await fetchFavoriteTasksByUser(id);
    setState(() {
      favoriteTasks = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('환경 보호 활동 찾기'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Center(
            heightFactor: 1,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  height: 70,
                  child: FutureBuilder<List<Category>>(
                      future: categories,
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? CategoryList(
                                categories: snapshot.data!,
                                updateTasks: updateTasks,
                                currentCategory: currentCategory)
                            : Center(child: CustomCircularProgressIndicator());
                      }),
                ),
                Divider(),
                Container(
                    margin: EdgeInsets.only(top: 5, bottom: 15),
                    child: Text('관심있는 활동들을 눌러서 확인해보세요',
                        textAlign: TextAlign.center, style: _biggerGreyFont)),
                Container(
                    width: 200,
                    child: TaskList(
                        tasks: tasks,
                        userId: userId,
                        favoriteTasks: favoriteTasks,
                        updateFavoriteTasks: updateFavoriteTasks,
                        updateToday: widget.updateToday)),
                // Container(child: Text(favoriteTasks.toString()))
              ],
            )));
  }
}

class CategoryList extends StatelessWidget {
  final List<Category> categories;
  final ValueChanged<int> updateTasks;

  int currentCategory;

  CategoryList(
      {Key? key,
      required this.categories,
      required this.updateTasks,
      required this.currentCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Container(width: 20);
      },
      padding: EdgeInsets.only(top: 8.0),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return CategoryWidget(
            label: categories[index].label,
            emoji: categories[index].emoji,
            id: categories[index].id,
            callback: updateTasks,
            currentCategory: currentCategory);
      },
    );
  }
}

class TaskList extends StatefulWidget {
  final List<Task> tasks;
  int userId;
  List<Task> favoriteTasks;
  Function(int) updateFavoriteTasks;
  Function updateToday;

  TaskList(
      {Key? key,
      required this.tasks,
      required this.userId,
      required this.favoriteTasks,
      required this.updateFavoriteTasks,
      required this.updateToday})
      : super(key: key);
  TaskListState createState() => TaskListState();
}

class TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Container(height: 10);
      },
      shrinkWrap: true,
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        bool isFavorite = false;
        for (int i = 0; i < widget.favoriteTasks.length; i++) {
          if (widget.favoriteTasks[i].id == widget.tasks[index].id) {
            isFavorite = true;
            // });
            break;
          }
        }

        return TaskWidget(
            task: widget.tasks[index],
            userId: widget.userId,
            isFavorite: isFavorite,
            favoriteTasks: widget.favoriteTasks,
            updateFavoriteTasks: widget.updateFavoriteTasks,
            updateToday: widget.updateToday);
      },
    );
  }
}
