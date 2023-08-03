import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class StickerImage extends StatelessWidget {
  final Color backColor;
  final Color fontColor;
  final String image;
  final Color recColor;
  final Color recColor2;

  const StickerImage(
      {super.key,
      required this.backColor,
      required this.fontColor,
      required this.image,
      required this.recColor,
      required this.recColor2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      color: backColor,
      child: Stack(alignment: AlignmentDirectional.centerStart, children: [
        Positioned(
          bottom: 100,
          child: customCotainer(
            context,
            color: recColor2,
            width: 0.6,
            height: 80,
          ),
        ),
        customCotainer(
          context,
          color: recColor,
          width: 0.8,
          height: 60,
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.4,
          child: Image.asset(
            image,
            width: MediaQuery.of(context).size.width * 0.6,
            height: 220,
            fit: BoxFit.contain,
          ),
        ),
        Container(
          width: 190,
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: 40,
              color: fontColor,
              fontWeight: FontWeight.w700,
            ),
            child: AnimatedTextKit(
              totalRepeatCount: 100,
              animatedTexts: [
                RotateAnimatedText('BE STRONG'),
                RotateAnimatedText('GAIN MORE POWER'),
                RotateAnimatedText('TRUST YOUR ABILITY'),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget customCotainer(context,
      {required double width, required double height, required Color color}) {
    return Container(
      width: MediaQuery.of(context).size.width * width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            color,
            color.withOpacity(0.3),
          ],
          end: Alignment.bottomLeft,
          begin: Alignment.topRight,
        ),
      ),
    );
  }
}
