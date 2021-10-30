import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:tickley/src/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 70),
              padding: EdgeInsets.only(left: 25),
              child: Text(
                'World',
                style: BiggerBoldFont,
              )),
          Stack(alignment: AlignmentDirectional.bottomCenter, children: [
            Container(
                height: 300,
                width: 200,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AspectRatio(
                        aspectRatio: 5 / 2,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  scale: 2,
                                  image: AssetImage('assets/pine-tree.png'),
                                  fit: BoxFit.fitWidth,
                                  alignment: FractionalOffset.bottomCenter)),
                        )))),
            Container(
                height: 300,
                width: 200,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: AspectRatio(
                        aspectRatio: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  scale: 2,
                                  image: AssetImage('assets/pine-tree.png'),
                                  fit: BoxFit.fitWidth,
                                  alignment: FractionalOffset.bottomCenter,
                                  colorFilter: ColorFilter.mode(
                                      Colors.black.withOpacity(0.2),
                                      BlendMode.dstATop))),
                        ))))
          ]),
        ])));
  }
}
