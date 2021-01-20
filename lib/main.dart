import 'package:flutter/material.dart';
import 'package:flutterApiWithProvider/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'R6 with Provider',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.teal,
            fontSize: 20.0,
          ),
        ),
      ),
      home: Home(),
    );
  }
}
