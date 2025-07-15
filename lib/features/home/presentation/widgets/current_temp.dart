import 'package:flutter/material.dart';

import '../../../../core/utlis/constants.dart';
import 'current_temp_items.dart';

class CurrentTemp extends StatelessWidget {
  const CurrentTemp({super.key, required this.currentTemp});

  final int currentTemp;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "current temperature".toUpperCase(),
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: AppConstants.kDefaultPading),
        CurrentTempItems(currentInsideTemp: currentTemp),
      ],
    );
  }
}
