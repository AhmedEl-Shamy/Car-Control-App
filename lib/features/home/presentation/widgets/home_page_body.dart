import 'package:flutter/material.dart';

import 'car_image_widget.dart';
import 'lock_unlock_button.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            alignment: Alignment.center,
            children: [
              CarImageWidget(constraints: constraints),
              Positioned(
                right: constraints.maxWidth * 0.05,
                child: LockUnLockButton(),
              ),
              Positioned(
                left: constraints.maxWidth * 0.05,
                child: LockUnLockButton(),
              ),
              Positioned(
                top: constraints.maxHeight * 0.13,
                child: LockUnLockButton(),
              ),
              Positioned(
                bottom: constraints.maxHeight * 0.17,
                child: LockUnLockButton(),
              ),
            ],
          );
        },
      ),
    );
  }
}