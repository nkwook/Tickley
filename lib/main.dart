import 'package:flutter/material.dart';
import 'src/bottomNavigator.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '티끌리',
      home: Login(),
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
    );
  }
}

class Login extends StatefulWidget {
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loginScreen(),
    );
  }

  Widget _loginScreen() {
    return Center(
      child: Column(
        children: <Widget>[
          _appLogo(),
          _loginForm(),
          
        ],
      ),
    );
  }

  Widget _appLogo() {
    return Container(
        height: 200,
        margin: EdgeInsets.only(top: 200, bottom: 100, left: 40, right: 40),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/logo_tickle.png'), fit: BoxFit.contain)));
  }

  Widget _loginForm() {
    var name;
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        // height: 400.0,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  name = value;
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('로그인 되었습니다')),
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  BottomNavigator(name: name)));
                    }
                  },
                  child: Center(child: const Text('Login')),
                ),
              ),
            ],
          ),
        ));
  }

  // Widget
}
