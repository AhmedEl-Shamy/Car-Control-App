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
        _buildTire(
          top: constraints.maxHeight * 0.12,
          left: constraints.maxWidth * 0.08,
        ),
        _buildTire(
          top: constraints.maxHeight * 0.12,
          right: constraints.maxWidth * 0.08,
        ),
        _buildTire(
          top: constraints.maxHeight * 0.7,
          left: constraints.maxWidth * 0.08,
        ),
        _buildTire(
          top: constraints.maxHeight * 0.7,
          right: constraints.maxWidth * 0.08,
        ),
      ],
    );
  }

  Positioned _buildTire({
    double? top,
    double? bottom,
    double? right,
    double? left,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      right: right,
      left: left,
      height: constraints.maxHeight * 0.17,
      child: AspectRatio(
        aspectRatio: 28 / 81,
        child: SvgPicture.asset(AppAssets.kIconsFLTyre),
      ),
    );
  }
}
