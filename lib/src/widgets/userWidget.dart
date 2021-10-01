// import 'package:flutter/material.dart';
// import 'package:tickley/src/model/task.dart';
// import '../utils/utils.dart';

// class UserWidget extends StatefulWidget {
//   final String profile_image;
//   final int id;
//   final ValueChanged<int> callback;
//   int currentCategory;

//   UserWidget(
//       {Key? key,
//       required this.profile_image,
//       required this.id,
//       required this.name,
//       required this.tasks,})
//       : super(key: key);

//   @override
//   UserWidgetState createState() => UserWidgetState();
// }

// class UserWidgetState extends State<UserWidget> {
//   // String e = '\\uD83D\\uDEAE';
//   Utils utils = new Utils();

//   final _biggerFont = const TextStyle(fontSize: 18.0);
//   // String s='0x'+widget.emoji;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Material(
//             child: InkWell(
//       borderRadius: BorderRadius.all(Radius.circular(20)),
//       onTap: () async {
//         widget.callback(widget.id);
//       },
//       child: Container(
//         decoration: BoxDecoration(
//             // boxShadow:
//             color: widget.currentCategory == widget.id
//                 ? Colors.green[50]
//                 : Colors.white,
//             border: Border.all(color: Colors.black),
//             borderRadius: BorderRadius.all(Radius.circular(20))),
//         padding: const EdgeInsets.all(8),
//         child: Text(utils.convertStringToUnicode(widget.emoji) + widget.label,
//             style: _biggerFont),
//       ),
//     )));
//   }
// }
