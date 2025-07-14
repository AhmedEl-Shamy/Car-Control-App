import 'package:flutter/material.dart';

import '../../../../core/utlis/app_assets.dart';
import '../../../../core/utlis/constants.dart';
import 'temp_details.dart';

class TempView extends StatefulWidget {
  const TempView({
    super.key,
    required this.currentIndex,
    required this.tempAnimation,
    required this.constraints,
  });
  final int currentIndex;
  final Animation<double> tempAnimation;
  final BoxConstraints constraints;

  @override
  State<TempView> createState() => _TempViewState();
}

class _TempViewState extends State<TempView> {
  bool isCoolActive = true;
  int currentTempDegree = 18;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          width: widget.constraints.maxWidth,
          height: widget.constraints.maxHeight,
          duration: AppConstants.kDefaultDuration,
          top: widget.currentIndex == 2 ? 0 : 50,
          child: AnimatedOpacity(
            duration: AppConstants.kDefaultDuration,
            opacity: widget.currentIndex == 2 ? 1 : 0,
            child: TempDetails(
              isCoolActive: isCoolActive,
              currentTempDegree: currentTempDegree,
              coolAction: () => setState(() {
                currentTempDegree = 18;
                isCoolActive = true;
              }),
              heatAction: () => setState(() {
                currentTempDegree = 30;
                isCoolActive = false;
              }),
              increaseTemp: _increaseTemp,
              decreaseTemp: _decreaseTemp,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: widget.tempAnimation,
          builder: (context, child) {
            return Positioned(
              right: 0,
              width: 200,
              child: Opacity(opacity: widget.tempAnimation.value, child: child),
            );
          },
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child: isCoolActive
                ? Image.asset(AppAssets.kImagesCoolGlow2, key: UniqueKey())
                : Image.asset(AppAssets.kImagesHotGlow4, key: UniqueKey()),
          ),
        ),
      ],
    );
  }

  void _increaseTemp() {
    currentTempDegree++;
    _updateTempMode();
    setState(() {});
  }

  void _decreaseTemp() {
    currentTempDegree--;
    _updateTempMode();
    setState(() {});
  }

  void _updateTempMode() {
    if (currentTempDegree >= 30) {
      isCoolActive = false;
    } else {
      isCoolActive = true;
    }
  }
}