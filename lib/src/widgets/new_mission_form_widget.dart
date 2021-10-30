import 'package:flutter/material.dart';
import 'package:tickley/src/utils/constants.dart';

import '../utils/utils.dart';

class NewMissionFormWidget extends StatefulWidget {
  NewMissionFormWidget({Key? key}) : super(key: key);

  @override
  NewMissionFormWidgetState createState() => NewMissionFormWidgetState();
}

class NewMissionFormWidgetState extends State<NewMissionFormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerName = new TextEditingController();
  TextEditingController _controllerDescription = new TextEditingController();
  TextEditingController _controllerCategory = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            // height: 300,
            // width: 300,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Form(
              key: _formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('환경 보호 미션을 제안해주세요.', style: BiggerFont),
                  Text('검토 후 반영됩니다:)', style: BiggerFont),
                  Container(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '미션 이름: ',
                          style: BiggerFont,
                        ),
                        Container(
                            width: 180,
                            child: TextFormField(
                              controller: _controllerName,
                              validator: (value) {
                                // if (value == null || value.isEmpty) {
                                //   return '닉네임을 입력해주세요';
                                // }
                                return null;
                              },
                            )),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '미션 카테고리: ',
                          style: BiggerFont,
                        ),
                        Container(
                            width: 180,
                            child: TextFormField(
                              controller: _controllerCategory,
                              validator: (value) {
                                // if (value == null || value.isEmpty) {
                                //   return '닉네임을 입력해주세요';
                                // }
                                return null;
                              },
                            )),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '미션 설명: ',
                          style: BiggerFont,
                        ),
                        Container(
                            width: 180,
                            child: TextFormField(
                              controller: _controllerDescription,
                              validator: (value) {
                                // if (value == null || value.isEmpty) {
                                //   return '닉네임을 입력해주세요';
                                // }
                                return null;
                              },
                            )),
                      ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Color(0x0000ff00))),
                      onPressed: () async {
                        _controllerName.clear();
                        _controllerCategory.clear();
                        _controllerDescription.clear();
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: 150,
                          child: Text('제출하기', style: BiggerFont)),
                    ),
                  ),
                ],
              ),
            )));
  }
}
