import 'package:flutter/material.dart';
import '../constant/colors.dart';

Future<DateTime?> customDatePicker(BuildContext context) async {
  DateTime? date = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2040),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          datePickerTheme: DatePickerThemeData(
            backgroundColor: darkGray,
          ),
          colorScheme: ColorScheme.light(
            primary: brightRed,
            onSurface: Colors.white,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
          ),
        ),
        child: child!,
      );
    },
  );

  return date;
}
