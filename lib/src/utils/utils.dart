import 'dart:convert';

import 'package:tickley/src/model/mission/mission.dart';
import 'package:tickley/src/model/mission_user/mission_user.dart';
import 'package:tickley/src/model/most_active_mission/most_active_mission.dart';

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

  String getTimeDifference(String completedTime) {
    var completedDateTime = DateTime.parse(completedTime);
    final timeDifference = DateTime.now().difference(completedDateTime);

    if (timeDifference.inDays > 0)
      return timeDifference.inDays.toString() + '일 전';
    else if (timeDifference.inHours > 0)
      return timeDifference.inHours.toString() + '시간 전';
    else if (timeDifference.inMinutes > 0)
      return timeDifference.inMinutes.toString() + '분 전';
    else
      return timeDifference.inSeconds.toString() + '초 전';
  }

  List<Mission> parseMissions(String responseBody) {
    final parsed = json.decode(responseBody);
    List<Mission> missionList = List<Mission>.from(
        parsed["data"].map((json) => Mission.fromJson(json)));
    return missionList;
  }

  List<MissionUser> parseMissionUsers(String responseBody) {
    final parsed = json.decode(responseBody);
    List<MissionUser> userList = List<MissionUser>.from(
        parsed["data"].map((json) => MissionUser.fromJson(json)));

    return userList;
  }

  List<MostActiveMission> parseMostActiveMissions(String responseBody) {
    final parsed = json.decode(responseBody);
    return List<MostActiveMission>.from(
        parsed["data"].map((json) => MostActiveMission.fromJson(json)));
  }
}
