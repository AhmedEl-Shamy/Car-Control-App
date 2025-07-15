import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utlis/app_assets.dart';

class CarTiers extends StatelessWidget {
  const CarTiers({super.key, required this.constraints});
  final BoxConstraints constraints;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: constraints.maxHeight * 0.12,
          left: constraints.maxWidth * 0.08,
          child: SvgPicture.asset(AppAssets.kIconsFLTyre),
        ),
        Positioned(
          top: constraints.maxHeight * 0.12,
          right: constraints.maxWidth * 0.08,
          child: SvgPicture.asset(AppAssets.kIconsFLTyre),
        ),
        Positioned(
          top: constraints.maxHeight * 0.7,
          left: constraints.maxWidth * 0.08,
          child: SvgPicture.asset(AppAssets.kIconsFLTyre),
        ),
        Positioned(
          top: constraints.maxHeight * 0.7,
          right: constraints.maxWidth * 0.08,
          child: SvgPicture.asset(AppAssets.kIconsFLTyre),
        ),
      ],
    );
  }
}