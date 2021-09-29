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
}
