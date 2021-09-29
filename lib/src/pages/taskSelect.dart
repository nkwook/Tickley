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
  late Future<List<Task>> tasks;
  late Future<Task> task;
  late Future<List<Category>> categories;

  @override
  void initState() {
    super.initState();
    task = fetchTaskByID(1);
    tasks = fetchAllTasks();
    categories = fetchCategories();
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
                    child: Expanded(
                      child: FutureBuilder<List<Category>>(
                          future: categories,
                          builder: (context, snapshot) {
                            return snapshot.hasData
                                ? CategoryList(categories: snapshot.data!)
                                : Center(child: CircularProgressIndicator());
                          }),
                    )),
                FutureBuilder<Task>(
                    future: task,
                    builder: (context, snapshot) {
                      return snapshot.hasData
                          ? Text(snapshot.data!.createdAt)
                          : Center(child: CircularProgressIndicator());
                    }),
                FutureBuilder<List<Task>>(
                    future: fetchAllTasks(),
                    builder: (context, snapshot) {
                      return snapshot.hasData
                          ? TaskList(tasks: snapshot.data!)
                          : Center(child: CircularProgressIndicator());
                    })
              ],
            )));
  }
}

class CategoryList extends StatelessWidget {
  final List<Category> categories;
  CategoryList({Key? key, required this.categories}) : super(key: key);

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
        );
      },
    );
  }
}

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskWidget();
        // (title: Text(tasks[index].label));
      },
    );
  }
}
