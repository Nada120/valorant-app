import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextWidget extends StatelessWidget {
  
  final Color textColor;
  final List<String> text;

  const AnimatedTextWidget({
    super.key, 
    required this.text, 
    this.textColor = Colors.white,
  });
  
  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedTextKit(
          animatedTexts: allAnimatedText(),
        ),
      );
  }

  List<TyperAnimatedText> allAnimatedText() {
    List<TyperAnimatedText> allText = [];
    for(int i=0; i<text.length; i++) {
      allText.add(
        TyperAnimatedText(
          text[i],
          textStyle: TextStyle(
            fontSize: 23,
            decoration: TextDecoration.none,
            color: textColor,
            fontFamily: 'gamerBold',
          ),
          speed: const Duration(milliseconds: 100),
        ),
      );
    }
    return allText;
  }
}