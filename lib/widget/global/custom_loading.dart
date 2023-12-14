import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading extends StatelessWidget {
  
  final double size;
  final List<Color> colors;

  const CustomLoading({
    super.key,
    required this.size,
    required this.colors
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeInOut(
        size: size,
        itemBuilder: (context, index) {
          final color = colors[index % colors.length];
          return DecoratedBox(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          );
        },
      ),
    );
  }
}