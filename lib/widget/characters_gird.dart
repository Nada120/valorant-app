import 'package:flutter/material.dart';

import '../constant/colors.dart';

class CharacterGirdView extends StatelessWidget {
  const CharacterGirdView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: darkGray,
      child: Column(
        children: [
          Image.asset('assets/images/back.png'),
          Container(
              color: darkRed,
              child: const Center(
                child: Text(
                  'none',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}