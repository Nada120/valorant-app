import 'package:flutter/material.dart';
import '../widget/background_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return const HomeUI();
  }
}

class HomeUI extends StatelessWidget {

  const HomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundHome( 
      imagePath: "assets/images/back.png", 
      textColor: Colors.white, 
    );
  }
}

