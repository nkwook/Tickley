import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final List<String> imageList = [
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.apple.com%2Fkr%2Fshop%2Fbuy-iphone%2Fiphone-11&psig=AOvVaw3Cjux8T5Onz_Bz1hFO2W6s&ust=1633179901602000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLj34rGjqfMCFQAAAAAdAAAAABAD",
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.apple.com%2Fkr%2Fnewsroom%2F2017%2F11%2Fiphone-x-arrives-in-south-korea-thailand-turkey-and-10-more-countries%2F&psig=AOvVaw0MufQkYq8FxZCw0Cm28SpL&ust=1633179925035000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMiZpL2jqfMCFQAAAAAdAAAAABAD",
    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fswappie.com%2Fno-en%2Fmodel%2Fiphone-8-plus%2F&psig=AOvVaw34ev0zcm1dW8-imG_UcpTV&ust=1633179937766000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMCQiMOjqfMCFQAAAAAdAAAAABAD"
  ];

  final List<String> missionList = [
    "플라스틱은 ~~만큼 줄였어요!",
    "물은 ~~~만큼 줄였습니다~",
    "이산화탄소는 ~~~ 만큼 줄였어요 :)",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlay: true,
            ),
            items:
                // imageList
                //   .map((e) => ClipRRect(
                //         borderRadius: BorderRadius.circular(8),
                //         child: Stack(
                //           fit: StackFit.expand,
                //           children: <Widget>[
                //             Image.network(
                //               e,
                //               width: 1050,
                //               height: 350,
                //               fit: BoxFit.cover,
                //             )
                //           ],
                //         ),
                //       ))
                //   .toList(),
                missionList
                    .map((e) => ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Text(
                                e,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ))
                    .toList(),
          ),
        ),
      ),
    );
  }
}
