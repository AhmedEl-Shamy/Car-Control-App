import 'package:flutter/material.dart';

import '../../../../core/utlis/constants.dart';
import '../../../domain/tire_entity.dart';

class TireStatusItem extends StatelessWidget {
  const TireStatusItem({
    super.key,
    required this.tire,
    required this.itemIndex,
  });
  final int itemIndex;
  final TireEntity tire;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: tire.tirePressure >= 29
            ? Colors.white10
            : AppConstants.kRedColor.withValues(alpha: 0.1),
        border: Border.all(
          color: tire.tirePressure >= 29
              ? AppConstants.kPrimaryColor
              : AppConstants.kRedColor,
          width: 2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppConstants.kDefaultPading),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: (itemIndex < 2)
              ? _buildTireItemDetails(context)
              : _buildTireItemDetails(context).reversed.toList(),
        ),
      ),
    );
  }

  List<Widget> _buildTireItemDetails(BuildContext context) {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: "${tire.tirePressure}",
              children: [TextSpan(text: "psi", style: TextStyle(fontSize: 24))],
            ),
            style: Theme.of(
              context,
            ).textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: AppConstants.kDefaultPading / 2),
          Text(
            '${tire.tireTemp}\u2103',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Spacer(),
      Visibility.maintain(
        visible: tire.tirePressure < 28,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "LOW",
              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text("PRESSURE", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    ];
  }
}