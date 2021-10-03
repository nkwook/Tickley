import 'package:flutter/material.dart';

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpace(double width) {
  return SizedBox(width: width);
}

Widget CustomCircularProgressIndicator() {
  return Container(
      // height: 100,
      child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.grey)));
}
