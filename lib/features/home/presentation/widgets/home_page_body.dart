import 'package:flutter/material.dart';

import 'battery_status_view.dart';
import 'car_image_widget.dart';
import 'door_lock_view.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    super.key,
    required this.currentIndex,
    required this.batteryAinmation,
  });
  final int currentIndex;
  final Animation<double> batteryAinmation;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: Alignment.center,
            children: [
              CarImageWidget(constraints: constraints),
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
            ],
          );
        },
      ),
    );
  }
}
