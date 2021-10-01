import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tickley/app_theme.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: Column(
          children: [
            Row(
              children: const [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/tickley.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    '닉네임',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),

          ],
        )
    );
  }
}
