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
  // late Future<List<Task>> tasks;
  late Future<Task> task;
  late Future<List<Category>> categories;
  late List<Task> tasks = [];
  int currentCategory = 1;

  @override
  void initState() {
    super.initState();
    task = fetchTaskByID(1);
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
                FutureBuilder<Task>(
                    future: task,
                    builder: (context, snapshot) {
                      return snapshot.hasData
                          ? Text(snapshot.data!.createdAt)
                          : Center(child: CircularProgressIndicator());
                    }),
                TaskList(tasks: tasks)
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

  TaskList({Key? key, required this.tasks}) : super(key: key);
  TaskListState createState() => TaskListState();
}

class TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        Task iTask = widget.tasks[index];
        return TaskWidget(
            label: iTask.label, emoji: '\\uD83D\\uDE0D', id: iTask.id);
      },
    );
  }
}
