import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickley/src/bloc/auth/auth_cubit.dart';
import 'package:tickley/src/bloc/auth/auth_state.dart';
import 'package:tickley/src/utils/authentication.dart';
import '../bottom_navigator.dart';

class RegisterScreen extends StatefulWidget {
  // User user;
  RegisterScreen({Key? key
      // required this.user,
      })
      : super(key: key);
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
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
                child: BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is Loaded) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('로그인 되었습니다')),
                        );
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BottomNavigator(tUser: state.tUser)));
                      }
                    },
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
                                User? user =
                                    await Authentication.signInWithGoogle(
                                        context: context);

                                if (_formKey.currentState!.validate()) {
                                  try {
                                    String? url = 'https://picsum.photos/200';
                                    if (user!.photoURL != null) {
                                      url = user.photoURL;
                                    }
                                    //not debugged + need to consider err case

                                    BlocProvider.of<AuthCubit>(context)
                                        .createUser(nickname, user.uid, url!);
                                  } catch (error) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('오류입니다. 네트워크 환경을 확인해주세요.')),
                                    );
                                  }
                                }
                              },
                              child: Center(child: const Text('Login')),
                            ),
                          ),
                        ],
                      ),
                    )))));
  }
}
