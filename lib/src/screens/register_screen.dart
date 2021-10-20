import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/api/api.dart';
import 'package:tickley/src/bloc/tUser/tUser_cubit.dart';
import '../bottom_navigator.dart';

class Register extends StatefulWidget {
  User user;
  Register({
    Key? key,
    required this.user,
  }) : super(key: key);
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  bool _isSigningIn = false;
  final _formKey = GlobalKey<FormState>();
  final _biggerFont = const TextStyle(fontSize: 18.0);
  String nickname = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('회원 가입')),
        body: Center(
            child: Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                // height: 400.0,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('환경 보호에 동참할 닉네임을 입력해주세요.', style: _biggerFont),
                      TextFormField(
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '닉네임을 입력해주세요';
                          }
                          nickname = value;
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                String? url = 'https://picsum.photos/200';
                                if (widget.user.photoURL != null) {
                                  url = widget.user.photoURL;
                                }
                                int status = await createUser(
                                    nickname, widget.user.uid, url!);
                                if (status == 200) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('로그인 되었습니다')));
                                } else {
                                  throw Exception();
                                }
                              } catch (error) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('오류입니다. 네트워크 환경을 확인해주세요.')),
                                );
                              }

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomNavigator(
                                          tUser: BlocProvider.of<TUserCubit>(
                                                  context)
                                              .state
                                              .tUserState)));
                            }
                          },
                          child: Center(child: const Text('Login')),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
