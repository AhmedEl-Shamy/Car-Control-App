import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utlis/constants.dart';

class TempButton extends StatelessWidget {
  const TempButton({
    super.key,
    required this.assetName,
    required this.label,
    required this.onTap,
    required this.isActive,
    this.activeColor = AppConstants.kPrimaryColor,
  });
  final String assetName;
  final String label;
  final VoidCallback onTap;
  final bool isActive;
  final Color activeColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            width: isActive ? 76 : 50,
            height: isActive ? 76 : 50,
            child: SvgPicture.asset(
              assetName,
              colorFilter: ColorFilter.mode(
                isActive ? activeColor : Colors.white38,
                BlendMode.srcIn,
              ),
            ),
          ),
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 200),
            style: TextStyle(
              fontSize: 16,
              color: isActive ? activeColor : Colors.white38,
            ),
            child: Text(label.toUpperCase()),
          ),
        ],
      ),
    );
  }
}