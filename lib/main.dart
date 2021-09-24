import 'package:flutter/material.dart';
import 'package:qtech_task/screen/home_screen.dart';

void main() => runApp(const MyHome());

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
