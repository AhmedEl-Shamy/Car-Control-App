import 'package:car_control_app/core/utlis/constants.dart';
import 'package:car_control_app/features/home/presentation/widgets/home_page_body.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_buttom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _batteryAnimationController;
  late Animation<double> batteryStatusAnimation;
  int currentIndex = 0;

  @override
  void initState() {
    _batteryAnimationController = AnimationController(
      vsync: this,
      duration: AppConstants.kDefaultDuration,
    );
    batteryStatusAnimation = CurvedAnimation(
      parent: _batteryAnimationController,
      curve: Curves.linear,
    );
    super.initState();
  }

  @override
  void dispose() {
    _batteryAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageBody(
        currentIndex: currentIndex,
        batteryAinmation: batteryStatusAnimation,
      ),
      bottomNavigationBar: CustomButtomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onTap,
      ),
    );
  }

  void _onTap(int value) async {
    currentIndex = value;
    if (value == 1) {
      Future.delayed(AppConstants.kDefaultDuration, () {
        _batteryAnimationController.forward();
      });
      setState(() {});
    } else {
      await _batteryAnimationController.reverse();
      setState(() {});
    }
  }
}
