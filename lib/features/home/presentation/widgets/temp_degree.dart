import 'package:flutter/material.dart';

class TempDegree extends StatelessWidget {
  const TempDegree({
    super.key,
    required this.degree,
    this.increaseCallback,
    this.decreaseCallback,
  });
  final int degree;
  final VoidCallback? increaseCallback;
  final VoidCallback? decreaseCallback;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: increaseCallback ?? () {},
          icon: Icon(Icons.arrow_drop_up, size: 48),
        ),
        Text('$degree\u2103', style: TextStyle(fontSize: 86)),
        IconButton(
          onPressed: decreaseCallback ?? () {},
          icon: Icon(Icons.arrow_drop_down, size: 48),
        ),
      ],
    );
  }
}