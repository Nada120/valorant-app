import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class BackgroundHome extends StatelessWidget {
  final double height;
  final double width;
  final String imagePath;
  final Color textColor;
  final List<String> text;

  const BackgroundHome({
    super.key,
    required this.height,
    required this.width,
    required this.imagePath,
    required this.textColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.only(bottom: height * 0.7),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            imagePath,
          ),  
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: AnimatedTextKit(
          animatedTexts: allAnimatedText(),
        ),
      ),
    );
  }

  List<TypewriterAnimatedText> allAnimatedText() {
    List<TypewriterAnimatedText> allText = [];
    for(int i=0; i<text.length; i++) {
      allText.add(
        TypewriterAnimatedText(
          text[i],
          textStyle: TextStyle(
            fontSize: 23,
            decoration: TextDecoration.none,
            color: textColor,
          ),
          speed: const Duration(milliseconds: 100),
        ),
      );
    }
    return allText;
  }
}
