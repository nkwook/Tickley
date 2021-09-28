import 'package:flutter/material.dart';
import '../widgets/taskWidget.dart';
import '../model/task.dart';
import '../api/api.dart';

class TaskSelect extends StatefulWidget {
  @override
  TaskSelectState createState() => TaskSelectState();
}

class TaskSelectState extends State<TaskSelect> {
  late Future<List<Task>> tasks;
  late Future<Task> task;

  @override
  void initState() {
    super.initState();
    task = fetchTaskByID(1);
    tasks = fetchAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('환경 보호 활동 찾기')),
        body: Center(
            heightFactor: 1,
            child: Column(
              children: [
                Text('test'),
                TaskWidget(),
                FutureBuilder<Task>(
                    future: task,
                    builder: (context, snapshot) {
                      return snapshot.hasData
                          ? Text(snapshot.data!.createdAt)
                          : Center(child: CircularProgressIndicator());
                    }),
                Expanded(
                    child: FutureBuilder<List<Task>>(
                        future: fetchAllTasks(),
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? TaskList(tasks: snapshot.data!)
                              : Center(child: CircularProgressIndicator());
                        }))
              ],
            )));
  }
}

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList({Key? key, required this.tasks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text(tasks[index].label));
      },
    );
  }
}
