import 'package:flutter/material.dart';

import '../widgets/car_layout_box.dart';
import '../widgets/car_tires.dart';
import '../widgets/tires_status_grid_view.dart';

class TiresView extends StatelessWidget {
  const TiresView({
    super.key,
    required this.tiresAnimation,
    required this.tiresStatusAnimations,
    required this.constraints,
  });

  final BoxConstraints constraints;
  final Animation<double> tiresAnimation;
  final List<Animation<double>> tiresStatusAnimations;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        FadeTransition(
          opacity: tiresAnimation,
          child: CarLayoutBox(
            outConstraints: constraints,
            builder: (context, constraints) {
              return CarTiers(constraints: constraints);
            },
          ),
        ),
        TiresStatusGridView(
          constraints: constraints,
          tiresStatusAnimations: tiresStatusAnimations,
        ),
      ],
    );
  }
}