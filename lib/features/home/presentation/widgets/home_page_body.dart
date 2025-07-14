import 'package:car_control_app/core/utlis/constants.dart';
import 'package:flutter/material.dart';

import 'battery_status_view.dart';
import 'car_image_widget.dart';
import 'door_lock_view.dart';
import 'temp_view.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
    required this.currentIndex,
    required this.batteryAinmation,
    required this.tempAnimation,
  });
  final int currentIndex;
  final Animation<double> batteryAinmation;
  final Animation<double> tempAnimation;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: Alignment.center,
            children: [
              AnimatedPositioned(
                duration: AppConstants.kDefaultDuration,
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                left: currentIndex == 2 ? constraints.maxWidth / 2 : 0,
                child: CarImageWidget(constraints: constraints),
              ),
              // door lock view
              DoorLockView(
                currentIndex: currentIndex,
                constraints: constraints,
              ),
              // battery view
              BatteryStatusView(
                currentIndex: currentIndex,
                constraints: constraints,
                batteryAinmation: batteryAinmation,
              ),
              // Temp View
              TempView(
                currentIndex: currentIndex,
                tempAnimation: tempAnimation,
                constraints: constraints,
              ),
            ],
          );
        },
      ),
    );
  }
}
