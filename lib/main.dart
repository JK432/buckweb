import 'package:bucklite/Widgets/theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Functions/Authentication.dart';
import 'Pages/Dash.dart';
import 'Pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

Widget _screen() => StreamBuilder(
    stream: Authentication().authState(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return const Dash();
      } else {
        return const Home();
      }
    });


class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _intialization = Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyD60w4kAYn5Nf4gn_reK5X6h-ufUzSFjnc",
        authDomain: "bucklite-5b25c.firebaseapp.com",
        projectId: "bucklite-5b25c",
        storageBucket: "bucklite-5b25c.appspot.com",
        messagingSenderId: "104791176901",
        appId: "1:104791176901:web:ecd3022ecfaee79e0462ac",
      ));
   MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme().themeData(),
      home: FutureBuilder(
        future: _intialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            if (kDebugMode) {
              print(snapshot.stackTrace);
            }
            return const Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return _screen();
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
