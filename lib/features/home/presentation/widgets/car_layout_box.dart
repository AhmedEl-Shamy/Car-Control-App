import 'package:flutter/material.dart';

class CarLayoutBox extends StatelessWidget {
  const CarLayoutBox({
    super.key,
    required this.outConstraints,
    required this.builder,
  });
  final BoxConstraints outConstraints;
  final Widget Function(BuildContext context, BoxConstraints constraints)
  builder;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: outConstraints.maxHeight * 0.1),
      child: AspectRatio(
        aspectRatio: 222 / 477,
        child: LayoutBuilder(builder: builder),
      ),
    );
  }
}