import 'package:flutter/material.dart';
import '../widgets/taskWidget.dart';
import '../widgets/categoryWidget.dart';
import '../model/task.dart';
import '../model/category.dart';
import '../api/api.dart';

class TaskSelect extends StatefulWidget {
  @override
  TaskSelectState createState() => TaskSelectState();
}

class TaskSelectState extends State<TaskSelect> {
  late Future<List<Category>> categories;
  late List<Task> tasks = [];
  late List<Task> userTasks = [];
  int currentCategory = 1;
  int userId = 1; //temp

  final _biggerGreyFont = const TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  void initState() {
    super.initState();
    updateUserTasks(userId);
    updateTasks(1);
    categories = fetchCategories();
  }

  void updateTasks(int id) async {
    List<Task> t = await fetchTasksByCategory(id);
    setState(() {
      tasks = t;
      currentCategory = id;
    });
  }

  void updateUserTasks(int id) async {
    List<Task> t = await fetchTasksByUser(id);
    print(t);
    setState(() {
      userTasks = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('환경 보호 활동 찾기')),
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
                            : Center(child: CircularProgressIndicator());
                      }),
                ),
                Divider(),
                Container(
                    margin: EdgeInsets.only(top: 5, bottom: 15),
                    child: Text('관심있는 활동들을 눌러보세요',
                        textAlign: TextAlign.center, style: _biggerGreyFont)),
                Container(
                    width: 200, child: TaskList(tasks: tasks, userId: userId))
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

  TaskList({Key? key, required this.tasks, required this.userId})
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
        return TaskWidget(task: widget.tasks[index], userId: widget.userId);
      },
    );
  }
}
