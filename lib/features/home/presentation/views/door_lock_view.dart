import 'package:flutter/material.dart';

import '../../../../core/utlis/constants.dart';
import '../widgets/lock_unlock_button.dart';

class DoorLockView extends StatelessWidget {
  const DoorLockView({
    super.key,
    required this.currentIndex,
    required this.outConstraints,
  });
  final int currentIndex;
  final BoxConstraints outConstraints;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: getCarImageHeight,
        maxWidth: getCarImageHeight * 222/477 * 1.3
      ),
      child: LayoutBuilder(
        builder: (context, constraints)  {
          return Stack(
            alignment: Alignment.center,
            children: [
              _buildDoorLockButtons(
                right: currentIndex == 0
                    ? 0
                    : constraints.maxWidth / 2,
              ),
              _buildDoorLockButtons(
                left: currentIndex == 0
                    ? 0
                    : constraints.maxWidth / 2,
              ),
              _buildDoorLockButtons(
                top: currentIndex == 0
                    ? constraints.maxHeight * 0.08
                    : constraints.maxHeight / 2,
              ),
              _buildDoorLockButtons(
                bottom: currentIndex == 0
                    ? constraints.maxHeight * 0.1
                    : constraints.maxHeight / 2,
              ),
            ],
          );
        }
      ),
    );
  }

  double get getCarImageHeight => outConstraints.maxHeight - outConstraints.maxHeight * 0.1 * 2;

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