import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utlis/app_assets.dart';

class CarImageWidget extends StatelessWidget {
  const CarImageWidget({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: constraints.maxHeight * 0.1),
      child: SvgPicture.asset(AppAssets.kIconsCar, width: double.infinity,),
    );
  }
}