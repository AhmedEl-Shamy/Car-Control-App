import 'package:car_control_app/core/utlis/app_assets.dart';
import 'package:car_control_app/core/utlis/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButtomNavigationBar extends StatelessWidget {
  const CustomButtomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final void Function(int value) onTap;

  final List<String> items = const [
    AppAssets.kIconsLock,
    AppAssets.kIconsCharge,
    AppAssets.kIconsTemp,
    AppAssets.kIconsTyre,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: items
          .map(
            (item) => BottomNavigationBarItem(
              backgroundColor: Colors.black,
              icon: SvgPicture.asset(
                item,
                colorFilter: items[currentIndex] == item
                    ? ColorFilter.mode(
                        AppConstants.kPrimaryColor,
                        BlendMode.srcIn,
                      )
                    : ColorFilter.mode(Color(0xFF929292), BlendMode.srcIn),
                    height: 33,
              ),
              label: "",
            ),
          )
          .toList(),
    );
  }
}
