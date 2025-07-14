import 'package:flutter/material.dart';

class CurrentTempItem extends StatelessWidget {
  const CurrentTempItem({
    super.key,
    required this.tempDegree,
    required this.label,
  });
  final int tempDegree;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label.toUpperCase()),
        Text('$tempDegree\u2103', style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}