import 'package:car_control_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CarControlApp());
}

class CarControlApp extends StatelessWidget {
  const CarControlApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Control App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

