import 'package:flutter/material.dart';
import 'package:calculator/home_screen.dart';

void main() {
  runApp(const Subhan());
}

class Subhan extends StatelessWidget {
  const Subhan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
