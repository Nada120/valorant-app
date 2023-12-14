import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData icon;
  final Color color;

  const CustomIconButton({
    super.key,
    required this.color,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
        size: 25,
      ),
    );
  }
}
