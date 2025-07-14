import 'package:car_control_app/core/utlis/constants.dart';
import 'package:car_control_app/features/home/presentation/widgets/home_page_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_buttom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _batteryAnimationController;
  late AnimationController _tempAnimationController;
  late Animation<double> batteryStatusAnimation;
  late Animation<double> tempAnimation;
  int currentIndex = 0;

  @override
  void initState() {
    _setupBatteryAnimation();
    _setupTempAnimation();
    super.initState();
  }

  void _setupBatteryAnimation() {
    _batteryAnimationController = AnimationController(
      vsync: this,
      duration: AppConstants.kDefaultDuration,
    );
    batteryStatusAnimation = CurvedAnimation(
      parent: _batteryAnimationController,
      curve: Curves.linear,
    );
  }

  void _setupTempAnimation() {
    _tempAnimationController = AnimationController(
      vsync: this,
      duration: AppConstants.kDefaultDuration,
    );
    tempAnimation = CurvedAnimation(
      parent: _tempAnimationController,
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    _batteryAnimationController.dispose();
    _tempAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageBody(
        currentIndex: currentIndex,
        batteryAinmation: batteryStatusAnimation,
        tempAnimation: tempAnimation,
      ),
      bottomNavigationBar: CustomButtomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onTap,
      ),
    );
  }

  void _onTap(int value) async {
    switch (currentIndex) {
      case 1:
        await _batteryAnimationController.reverse();
      case 2:
        await _tempAnimationController.reverse();
    }

    switch (value) {
      case 0:
        currentIndex = value;
        setState(() {});
      case 1:
        Future.delayed(AppConstants.kDefaultDuration, () {
          _batteryAnimationController.forward();
        });
        currentIndex = value;
        setState(() {});
      case 2:
        Future.delayed(AppConstants.kDefaultDuration, () {
          _tempAnimationController.forward();
        });
        currentIndex = value;
        setState(() {});
      case 3:
        currentIndex = value;
        setState(() {});
    }
  }
}
