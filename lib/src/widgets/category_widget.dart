import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/mission/mission_cubit.dart';
import 'package:tickley/src/utils/constants.dart';

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
  Utils utils = new Utils();
  final TextStyle titleStyle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: COLOR_GREEN);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Material(
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              onTap: () {
                BlocProvider.of<MissionCubit>(context).fetchMissionsByCategory(widget.id);
                widget.updateCurrentCategory(widget.id);
              },
              child: Container(
                height: 48,
                padding: EdgeInsets.symmetric(vertical: 9, horizontal: 14),
                decoration: BoxDecoration(
                    color: widget.currentCategory == widget.id
                        ? COLOR_GREEN.withOpacity(0.13)
                        : Colors.white,
                    border: widget.currentCategory == widget.id
                        ? Border.all(color: COLOR_GREEN)
                        : Border.all(color: COLOR_BORDER),
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                child: Text(widget.label,
                    style: widget.currentCategory == widget.id
                        ? titleStyle
                        : titleStyle.copyWith(color: COLOR_BORDER)),
              ),
            )
        )
    );
  }
}
