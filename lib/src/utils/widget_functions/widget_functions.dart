import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/utils.dart';

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpace(double width) {
  return SizedBox(width: width);
}

Widget CustomCircularProgressIndicator() {
  return SizedBox(
      height: 50,
      width: 50,
      child: Center(
          child: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.grey))));
}
