import 'package:flutter/material.dart';
import '../widget/home page/background_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundHome( 
      imagePath: "assets/images/back.png", 
      textColor: Colors.white, 
    );
  }
}

