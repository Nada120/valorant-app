import 'package:flutter/material.dart';

class CustoBmutton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final IconData icon;
  final Color iconColor;
  final Function()? process;

  const CustoBmutton({
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
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith(
            (states) =>
                const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          ),
          backgroundColor:
              MaterialStateProperty.resolveWith((states) => backgroundColor),
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
