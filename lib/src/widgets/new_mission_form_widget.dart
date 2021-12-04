import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/suggestion/suggest_mission_cubit.dart';
import 'package:tickley/src/bloc/suggestion/suggest_mission_state.dart';
import 'package:tickley/src/repository/mission_repository.dart';
import 'package:tickley/src/utils/constants.dart';
import 'package:tickley/src/utils/widget_functions.dart';

import '../utils/utils.dart';

class NewMissionFormWidget extends StatefulWidget {
  Function setSuggestion;
  NewMissionFormWidget({Key? key, required this.setSuggestion})
      : super(key: key);

  @override
  NewMissionFormWidgetState createState() => NewMissionFormWidgetState();
}

class NewMissionFormWidgetState extends State<NewMissionFormWidget> {
  String label = '';
  String description = '';
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerName = new TextEditingController();
  TextEditingController _controllerDescription = new TextEditingController();
  // TextEditingController _controllerCategory = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(children: [
      Positioned(
          top: 30,
          left: 30,
          child: GestureDetector(
              child: Icon(Icons.arrow_back_ios),
              onTap: () => widget.setSuggestion())),
      Column(children: [
        SizedBox(height: 30),
        Container(height: 40, child: Text("새 미션 제안하기", style: FontBoldGreen24)),
        Container(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('번뜩이는 새로운 미션을 제안해주세요!',
                      style: TextStyle(
                          color: Color(0xFFADADAD),
                          fontSize: 15,
                          fontWeight: FontWeight.bold)),
                  // Text('검토 후 반영됩니다:)', style: BiggerFont),
                  Container(height: 20),
                  Container(
                      width: 320,
                      child: TextFormField(
                        maxLines: 1,
                        decoration: InputDecoration(
                            focusColor: Colors.black,
                            border: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFC1C1C1))),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: COLOR_GREEN)),
                            hintText: '미션 제목',
                            hintStyle: TextStyle(
                                color: Color(0xFFDBDBDB), fontSize: 16)),
                        controller: _controllerName,
                        validator: (value) {
                          if (value == null || value.isEmpty || value == '') {
                            return '제목을 입력해주세요';
                          }
                          setState(() {
                            label = value;
                          });
                          return null;
                        },
                      )),
                  SizedBox(height: 20),
                  Container(
                      width: 320,
                      child: TextFormField(
                        maxLines: 7,
                        decoration: InputDecoration(
                            border: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFC1C1C1))),
                            focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: COLOR_GREEN)),
                            hintText: '미션에 대해 설명해주세요',
                            hintStyle: TextStyle(
                                color: Color(0xFFDBDBDB), fontSize: 16)),
                        controller: _controllerDescription,
                        validator: (value) {
                          if (value == null || value.isEmpty || value == '') {
                            return '설명을 입력해주세요';
                          }
                          setState(() {
                            description = value;
                          });
                          return null;
                        },
                      )),
                  SizedBox(height: 30),

                  BlocListener<SuggestMissionCubit, SuggestMissionState>(
                      listener: (_, state) {
                        if (state is Empty) {
                          Container();
                        } else if (state is Loading) {
                          CustomCircularProgressIndicator();
                        } else if (state is Error) {
                          Text('에러가 발생했습니다. 다시 시도해주세요.',
                              style: TextStyle(color: Colors.amber));
                        } else if (state is Loaded) {
                          showCupertinoDialog(
                              barrierDismissible: true,
                              context: context,
                              builder: (_) {
                                return CupertinoAlertDialog(
                                    title: Text('새 미션이 제안되었습니다 \u{1F604}'),
                                    content: Text('건강한 지구를 위해 노력해주셔서 감사합니다.'),
                                    actions: [
                                      CupertinoDialogAction(
                                        child: Text('확인'),
                                        onPressed: () {
                                          Navigator.pop(_);
                                        },
                                      )
                                    ]);
                              });
                        }
                      },
                      child: GreenButton(
                          text: '제출하기',
                          onTapFunction: () async {
                            if (_formKey.currentState!.validate()) {
                              // try{
                              //   await MissionRepository.postMissionSuggestion(label, description);
                              // }
                              BlocProvider.of<SuggestMissionCubit>(context)
                                  .postMissionSuggestion(label, description);
                              _controllerName.clear();
                              _controllerDescription.clear();
                              setState(() {
                                label = '';
                                description = '';
                              });
                            }
                          })),
                  SizedBox(height: 15),
                ],
              ),
            ))
      ])
    ]));
  }
}
