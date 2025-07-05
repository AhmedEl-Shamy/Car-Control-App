import 'package:flutter/material.dart';

import 'car_image_widget.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(children: [CarImageWidget(constraints: constraints)]);
        },
      ),
    );
  }
}
