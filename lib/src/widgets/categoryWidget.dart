import 'package:flutter/material.dart';
import '../utils/utils.dart';
import '../todayCategoryModal.dart';

class CategoryWidget extends StatefulWidget {
  final String label;
  final String emoji;

  CategoryWidget({Key? key, required this.label, required this.emoji})
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
      onTap: () {
        // showModalBottomSheet(
        //     context: context,
        //     builder: (BuildContext context) {
        //       return TodayCategoryModal(temp: temp);
        //     });
      },
      child: Container(
        decoration: BoxDecoration(
            // boxShadow:
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        padding: const EdgeInsets.all(8),
        child: Text(utils.convertStringToUnicode(widget.emoji) + widget.label,
            style: _biggerFont),
      ),
    )));
  }
}
