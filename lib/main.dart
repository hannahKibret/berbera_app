import 'package:berbera_app/pages/sign_in.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  Color col = Color(0xFFFFA500);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Berbera',
        theme: ThemeData(
          primaryColor: col,
          fontFamily: 'Helvetica',
          brightness: Brightness.dark,
        ),
        home: SignInPage());
  }
}
