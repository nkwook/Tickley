import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/mission/mission_cubit.dart';

import '../utils/utils.dart';

class CategoryWidget extends StatefulWidget {
  final String label;
  final String emoji;
  final int id;
  final ValueChanged<int> updateCurrentCategory;
  int currentCategory;

  CategoryWidget(
      {Key? key,
      required this.label,
      required this.emoji,
      required this.id,
      required this.updateCurrentCategory,
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
            child: InkWell(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      onTap: () {
        BlocProvider.of<MissionCubit>(context)
            .fetchMissionsByCategory(widget.id);

        widget.updateCurrentCategory(widget.id);
      },
      child: Container(
        decoration: BoxDecoration(
            // boxShadow:
            color: widget.currentCategory == widget.id
                ? Colors.green[50]
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
