import 'package:flutter/material.dart';

import '../../../../core/utlis/app_assets.dart';
import '../../../../core/utlis/constants.dart';
import 'temp_button.dart';

class TempButtons extends StatelessWidget {
  const TempButtons({
    super.key,
    required this.coolAction,
    required this.heetAction,
    required this.isCoolActive,
  });

  final bool isCoolActive;
  final VoidCallback coolAction;
  final VoidCallback heetAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TempButton(
          assetName: AppAssets.kIconsCoolShape,
          label: 'cool',
          isActive: isCoolActive,
          onTap: coolAction,
        ),
        SizedBox(width: AppConstants.kDefaultPading / 2),
        TempButton(
          assetName: AppAssets.kIconsHeatShape,
          label: 'heat',
          isActive: !isCoolActive,
          activeColor: AppConstants.kRedColor,
          onTap: heetAction,
        ),
      ],
    );
  }
}
