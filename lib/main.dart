import 'package:flutter/material.dart';
import 'package:pokedex/screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pokedex",
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
