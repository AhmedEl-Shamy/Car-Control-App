import 'package:flutter/material.dart';

import '../../../../core/utlis/constants.dart';
import 'current_temp_item.dart';

class CurrentTempItems extends StatelessWidget {
  const CurrentTempItems({super.key, required this.currentInsideTemp});
  final int currentInsideTemp;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CurrentTempItem(label: 'inside', tempDegree: currentInsideTemp),
        SizedBox(width: AppConstants.kDefaultPading),
        CurrentTempItem(tempDegree: 30, label: 'outside'),
      ],
    );
  }
}
