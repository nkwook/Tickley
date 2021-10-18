import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tickley/src/utils/authentication.dart';
import 'package:tickley/src/utils/widget_functions.dart';
import 'tickley.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: Authentication.initializeFirebase(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          throw Exception('error');
        }
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return TickleyApp();
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return CustomCircularProgressIndicator();
      },
    );
  }
}
