import 'package:flutter/material.dart';

import '../../../../core/utlis/constants.dart';
import '../widgets/lock_unlock_button.dart';

class DoorLockView extends StatelessWidget {
  const DoorLockView({
    super.key,
    required this.currentIndex,
    required this.constraints,
  });
  final int currentIndex;
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _buildDoorLockButtons(
          right: currentIndex == 0
              ? constraints.maxWidth * 0.05
              : constraints.maxWidth / 2,
        ),
        _buildDoorLockButtons(
          left: currentIndex == 0
              ? constraints.maxWidth * 0.05
              : constraints.maxWidth / 2,
        ),
        _buildDoorLockButtons(
          top: currentIndex == 0
              ? constraints.maxHeight * 0.13
              : constraints.maxHeight / 2,
        ),
        _buildDoorLockButtons(
          bottom: currentIndex == 0
              ? constraints.maxHeight * 0.17
              : constraints.maxHeight / 2,
        ),
      ],
    );
  }

  AnimatedPositioned _buildDoorLockButtons({
    double? right,
    double? left,
    double? bottom,
    double? top,
  }) {
    return AnimatedPositioned(
      duration: AppConstants.kDefaultDuration,
      right: right,
      left: left,
      top: top,
      bottom: bottom,
      child: AnimatedOpacity(
        duration: AppConstants.kDefaultDuration,
        opacity: currentIndex == 0 ? 1 : 0,
        child: LockUnLockButton(),
      ),
    );
  }
}