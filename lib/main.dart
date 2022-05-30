import 'package:flutter/material.dart';
import 'package:flutter_snapchat_app/true_screen/authentication_screen.dart';

void main() {
  //runApp(MaterialApp(home:LoginScreen()) );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Snapchat UI',
      theme: ThemeData(),
      home: AuthenticationScreen(),
    );
  }
}
