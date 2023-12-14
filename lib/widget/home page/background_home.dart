import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../../constant/text.dart';
import '../../screens/characters_page.dart';
import 'animated_text.dart';
import '../global/custom_button.dart';
import '../global/custom_navigator.dart';

class BackgroundHome extends StatelessWidget {
  final String imagePath;
  final Color textColor;

  const BackgroundHome({
    super.key,
    required this.imagePath,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    
    return Container(
      height: deviceHeight,
      width: deviceWidth,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            imagePath,
          ),  
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 1,),
          AnimatedTextWidget(
            text: titles,
          ),
          const Spacer(flex: 4,),
          CustomButton(
            text: 'START',
            backgroundColor: brightRed,
            icon: Icons.gps_fixed_outlined,
            process: (){
              pushRemovePage(
                context, 
                const CharactersPage(),
              );
            },
          ),
          const Spacer(flex: 2,),
        ],
      ),
    );
  }
}
