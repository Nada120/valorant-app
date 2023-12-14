import 'package:flutter/material.dart';
import '../../constant/colors.dart';

Widget setTitle({
  required String title,
  double fontSize = 17,
  FontWeight fontWeight = FontWeight.w800,
  Color fontColor = Colors.black,
}) {
  return Text(
    title,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: fontColor,
    ),
  );
}

Widget setData({
  required String text,
  required double width,
}) {
  return SizedBox(
    width: width,
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 14,
      ),
    ),
  );
}

Widget setAbilities({
  required String title,
  required String description,
  required double width,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Row(
        children: [
          setTitle(
            title: 'Name: ',
            fontSize: 14,
          ),
          setTitle(
            title: title,
            fontColor: darkRed,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
      setData(
        text: description,
        width: width,
      ),
    ],
  );
}
