import 'package:flutter/material.dart';
import 'package:tickley/src/model/task.dart';
import '../utils/utils.dart';

class CategoryWidget extends StatefulWidget {
  final String label;
  final String emoji;
  final int id;
  final ValueChanged<int> callback;
  int currentCategory;

  CategoryWidget(
      {Key? key,
      required this.label,
      required this.emoji,
      required this.id,
      required this.callback,
      required this.currentCategory})
      : super(key: key);

  @override
  CategoryWidgetState createState() => CategoryWidgetState();
}

class CategoryWidgetState extends State<CategoryWidget> {
  // String e = '\\uD83D\\uDEAE';
  Utils utils = new Utils();

  final _biggerFont = const TextStyle(fontSize: 18.0);
  // String s='0x'+widget.emoji;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Material(
            // color: Colors.green[100],
            child: InkWell(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      onTap: () async {
        // List<Task> t = await fetchTasksByCategory(widget.id);
        print(widget.id);
        widget.callback(widget.id);
      },
      child: Container(
        decoration: BoxDecoration(
            // boxShadow:
            color: widget.currentCategory == widget.id
                ? Colors.blue
                : Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        padding: const EdgeInsets.all(8),
        child: Text(utils.convertStringToUnicode(widget.emoji) + widget.label,
            style: _biggerFont),
      ),
    )));
  }
}
