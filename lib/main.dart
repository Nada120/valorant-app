import 'package:flutter/material.dart';
import 'package:valorant_app/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VALORANT APP',
      theme: ThemeData(
        fontFamily: 'gamerBold',
      ),
      home: const HomePage(),
    );
  }
}
