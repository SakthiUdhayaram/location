import 'package:flutter/material.dart';
import 'input_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Location Based App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LocationInputScreen(),
    );
  }
}
