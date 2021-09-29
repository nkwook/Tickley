import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tickley/app_theme.dart';

class MyPage extends StatefulWidget {
  MyPage(this.child);

  final Widget child;

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
                  backgroundImage: AssetImage('assets/wazoski.png'),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    '마이크와조스키',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
            CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.all(10),
                    sliver: SliverGrid.count(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      children: [
                        Container(
                          color: AppTheme.tickleyColor,
                          child: Column(
                            children: const [
                              Icon(
                                Icons.emoji_events,
                                color: Colors.black,
                                size: 24.0,
                              ),
                              Text(
                                  '내 성취'
                              )
                            ],
                          ),
                        ),
                        Container(
                          color: AppTheme.tickleyColor,
                          child: Column(
                            children: const [
                              Icon(
                                Icons.monetization_on,
                                color: Colors.black,
                                size: 24.0,
                              ),
                              Text(
                                  '내 포인트'
                              )
                            ],
                          ),

                        )
                      ],
                    ),
                  ),
                ]
            ),
          ],
        )
    );
  }
}
