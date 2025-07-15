import 'package:car_control_app/core/utlis/constants.dart';
import 'package:flutter/material.dart';

import '../views/battery_status_view.dart';
import 'car_image_widget.dart';
import '../views/door_lock_view.dart';
import '../views/temp_view.dart';
import '../views/tires_view.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
    required this.currentIndex,
    required this.batteryAinmation,
    required this.tempAnimation,
    required this.tiresAnimation,
    required this.tiresStatusAnimations,
  });
  final int currentIndex;
  final Animation<double> batteryAinmation;
  final Animation<double> tempAnimation;
  final Animation<double> tiresAnimation;
  final List<Animation<double>> tiresStatusAnimations;
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
                // aspect ratio = 222 / 477
                child: CarImageWidget(constraints: constraints),
              ),
              // door lock view
              IgnorePointer(
                ignoring: currentIndex != 0,
                child: DoorLockView(
                  currentIndex: currentIndex,
                  constraints: constraints,
                ),
              ),
              // battery view
              IgnorePointer(
                ignoring: currentIndex != 1,
                child: BatteryStatusView(
                  currentIndex: currentIndex,
                  constraints: constraints,
                  batteryAinmation: batteryAinmation,
                ),
              ),
              // Temp View
              IgnorePointer(
                ignoring: currentIndex != 2,
                child: TempView(
                  currentIndex: currentIndex,
                  tempAnimation: tempAnimation,
                  constraints: constraints,
                ),
              ),
              // Tires View
              IgnorePointer(
                ignoring: currentIndex != 3,
                child: TiresView(
                  tiresAnimation: tiresAnimation,
                  tiresStatusAnimations: tiresStatusAnimations,
                  constraints: constraints,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}


