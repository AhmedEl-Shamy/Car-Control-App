import 'package:flutter/material.dart';

import '../../../../core/utlis/constants.dart';
import '../../../domain/tire_entity.dart';
import 'tires_status_item.dart';

class TiresStatusGridView extends StatelessWidget {
  TiresStatusGridView({
    super.key,
    required this.constraints,
    required this.tiresStatusAnimations,
  });
  final BoxConstraints constraints;
  final List<Animation<double>> tiresStatusAnimations;
  final List<TireEntity> tires = [
    TireEntity(tirePressure: 23.6, tireTemp: 56),
    TireEntity(tirePressure: 35, tireTemp: 41),
    TireEntity(tirePressure: 34.6, tireTemp: 41),
    TireEntity(tirePressure: 34.8, tireTemp: 42),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppConstants.kDefaultPading,
        crossAxisSpacing: AppConstants.kDefaultPading,
        childAspectRatio: _getAspectRatio,
      ),
      itemCount: 4,
      itemBuilder: (context, index) => ScaleTransition(
        scale: tiresStatusAnimations[index],
        child: TireStatusItem(tire: tires[index], itemIndex: index),
      ),
    );
  }

  double get _getAspectRatio {
    double width = constraints.maxWidth - AppConstants.kDefaultPading;
    double height = constraints.maxHeight - AppConstants.kDefaultPading;
    return width / height;
  }
}
