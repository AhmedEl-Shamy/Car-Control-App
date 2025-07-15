import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utlis/app_assets.dart';
import '../../../../core/utlis/constants.dart';
import '../widgets/battery_status_info_widget.dart';

class BatteryStatusView extends StatelessWidget {
  const BatteryStatusView({
    super.key,
    required this.currentIndex,
    required this.constraints,
    required this.batteryAinmation,
  });
  final int currentIndex;
  final BoxConstraints constraints;
  final Animation<double> batteryAinmation;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedOpacity(
          opacity: currentIndex == 1 ? 1 : 0,
          duration: AppConstants.kDefaultDuration,
          child: Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(
              AppAssets.kIconsBattery,
              width: constraints.maxWidth * 0.45,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: batteryAinmation,
          builder: (context, child) {
            return Positioned(
              top: 50 * (1 - batteryAinmation.value),
              child: Opacity(
                opacity: batteryAinmation.value,
                child: ConstrainedBox(constraints: constraints, child: child),
              ),
            );
          },
          child: BatteryStatusInfo(constraints: constraints),
        ),
      ],
    );
  }
}