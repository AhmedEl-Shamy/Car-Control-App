import 'package:flutter/material.dart';

import '../../../../core/utlis/constants.dart';
import 'current_temp.dart';
import 'temp_buttons.dart';
import 'temp_degree.dart';

class TempDetails extends StatelessWidget {
  const TempDetails({
    super.key,
    required this.isCoolActive,
    required this.currentTempDegree,
    required this.coolAction,
    required this.heatAction,
    required this.increaseTemp,
    required this.decreaseTemp,
  });
  final bool isCoolActive;
  final int currentTempDegree;
  final VoidCallback coolAction;
  final VoidCallback heatAction;
  final VoidCallback increaseTemp;
  final VoidCallback decreaseTemp;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.kDefaultPading),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            child: TempButtons(
              isCoolActive: isCoolActive,
              coolAction: coolAction,
              heetAction: heatAction,
            ),
          ),
          Spacer(),
          TempDegree(
            degree: currentTempDegree,
            increaseCallback: increaseTemp,
            decreaseCallback: decreaseTemp,
          ),
          Spacer(),
          CurrentTemp(currentTemp: currentTempDegree),
        ],
      ),
    );
  }
}