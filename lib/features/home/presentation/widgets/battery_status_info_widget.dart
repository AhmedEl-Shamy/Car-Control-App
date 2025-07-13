import 'package:flutter/material.dart';

import '../../../../core/utlis/constants.dart';
import 'battery_info.dart';

class BatteryStatusInfo extends StatelessWidget {
  const BatteryStatusInfo({super.key, required this.constraints});
  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '220 mi',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(color: Colors.white),
        ),
        Text('62%', style: TextStyle(fontSize: 24)),
        Spacer(),
        Text("charging".toUpperCase(), style: TextStyle(fontSize: 20)),
        Text("18 min remaining", style: TextStyle(fontSize: 20)),
        SizedBox(height: constraints.maxHeight * 0.14),
        BatteryInfo(),
        SizedBox(height: AppConstants.kDefaultPading),
      ],
    );
  }
}