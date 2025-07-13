import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utlis/app_assets.dart';
import '../../../../core/utlis/constants.dart';

class LockUnLockButton extends StatefulWidget {
  const LockUnLockButton({super.key});

  @override
  State<LockUnLockButton> createState() => _LockUnLockButtonState();
}

class _LockUnLockButtonState extends State<LockUnLockButton> {
  bool isLooked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        isLooked = !isLooked;
      }),
      child: AnimatedSwitcher(
        duration: AppConstants.kDefaultDuration,
        switchInCurve: Curves.easeInOutBack,
        switchOutCurve: Curves.easeInOutBack,
        transitionBuilder: (child, animation) =>
            ScaleTransition(scale: animation, child: child),
        child: !isLooked
            ? SvgPicture.asset(AppAssets.kIconsDoorLock, key: UniqueKey())
            : SvgPicture.asset(AppAssets.kIconsDoorUnlock, key: UniqueKey()),
      ),
    );
  }
}
