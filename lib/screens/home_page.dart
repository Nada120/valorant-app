import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:valorant_app/service/characters_service.dart';

import '../widget/background_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  late double deviceHeight;
  late double deviceWidth;
  
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    
    return HomeUI(
      height: deviceHeight, 
      width: deviceWidth,
    );
  }
}

class HomeUI extends StatelessWidget {
  final double height;
  final double width;
  final List<String> text = [
    "VALORANT GAME",
    "LET'S PLAY WITH FIRE",
    "ARE YOU READY OR WHAT?"
  ];

  HomeUI({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BackgroundHome(
            height: height, 
            width: width, 
            imagePath: "assets/back.png", 
            textColor: Colors.white, 
            text: text,
          ),
        ],
      ),
    );
  }
}

