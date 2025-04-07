import 'package:appdona/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Donut App',
      theme: ThemeData(
        tabBarTheme: const TabBarTheme(
          indicatorColor: Colors.pink,
        ),
      ),
      home: const HomePage(),
    );
  }
}