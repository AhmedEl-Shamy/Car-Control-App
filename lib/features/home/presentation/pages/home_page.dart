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
  late AnimationController _tiresAnimationController;
  late Animation<double> batteryStatusAnimation;
  late Animation<double> tempAnimation;
  late Animation<double> tiresAnimation;
  late List<Animation<double>> tiresStatusAnimation;
  int currentIndex = 0;
  @override
  void initState() {
    _setupBatteryAnimation();
    _setupTempAnimation();
    _setupTiresAnimation();
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

  void _setupTiresAnimation() {
    _tiresAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    tiresAnimation = CurvedAnimation(
      parent: _tiresAnimationController,
      curve: Interval(0, 0.2),
    );
    tiresStatusAnimation = List.generate(
      4,
      (index) => CurvedAnimation(
        parent: _tiresAnimationController,
        curve: Interval((index + 1) * 0.2, (index + 2) * 0.2),
      ),
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
        tiresAnimation: tiresAnimation,
        tiresStatusAnimations: tiresStatusAnimation,
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
      case 3:
        await _tiresAnimationController.reverse();
    }

    switch (value) {
      case 0:
        _updateUI(value);
      case 1:
        Future.delayed(AppConstants.kDefaultDuration, () {
          _batteryAnimationController.forward();
        });
        _updateUI(value);
      case 2:
        Future.delayed(AppConstants.kDefaultDuration, () {
          _tempAnimationController.forward();
        });
        _updateUI(value);
      case 3:
        Future.delayed(AppConstants.kDefaultDuration, () {
          _tiresAnimationController.forward();
        });
        _updateUI(value);
    }
  }

  void _updateUI(int value) {
    currentIndex = value;
    setState(() {});
  }
}
