import 'package:flutter/material.dart';
import 'package:flutter_speech_text_app/home/home.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Voice',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
