import 'package:flutter/material.dart';
import 'package:new_app/home_page.dart';
import 'package:new_app/test_page.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark(),
      // darkTheme: ThemeData.dark(),
      home: TestPage(),
    );
  }
}
