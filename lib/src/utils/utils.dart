import 'dart:convert';

import 'package:tickley/src/model/mission/mission.dart';

class Utils {
  String convertStringToUnicode(String content) {
    String regex = "\\u";
    int offset = content.indexOf(regex) + regex.length;
    while (offset > 1) {
      int limit = offset + 4;
      String str = content.substring(offset, limit);
//     print(str);
      if (str != null && str.isNotEmpty) {
        String uni = String.fromCharCode(int.parse(str, radix: 16));

        content = content.replaceFirst(regex + str, uni);
//       print(content);

      }
      offset = content.indexOf(regex) + regex.length;
//     print(offset);
    }
    return content;
  }

  List<DateTime> getDateList() {
    var dateTime = new DateTime.now();

    List<DateTime> dateList = [];
    final startDate = dateTime.subtract(Duration(days: dateTime.weekday - 1));
    for (int i = 0; i < 7; i++) {
      dateList.add(startDate.add(Duration(days: i)));
    }
    return dateList;
  }

  List<Mission> parseMissions(String responseBody) {
    final parsed = json.decode(responseBody);
    List<Mission> missionList = List<Mission>.from(
        parsed["data"].map((json) => Mission.fromJson(json)));
    return missionList;
  }
}
