import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final Function()? process;

  const CustomButton({
    super.key,
    required this.text,
    this.textColor = Colors.white,
    required this.backgroundColor,
    required this.icon,
    this.iconColor = Colors.white,
    required this.process,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          backgroundColor: backgroundColor,
          maximumSize: const Size(180, 50),
        ),
        onPressed: process,
        icon: Icon(
          icon,
          color: iconColor,
        ),
        label: Text(
          text,
          style: TextStyle(
            fontFamily: 'gamerBold',
            color: textColor,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
