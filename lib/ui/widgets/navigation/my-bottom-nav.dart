import 'package:flutter/material.dart';
import 'package:lobolabs_ebalance_flutter_app/destination.dart';
import 'package:lobolabs_ebalance_flutter_app/ui/transitions/my-bottom-bar-transition.dart';

import '../../../animation.dart';

class MyBottomNavigation extends StatelessWidget {
  const MyBottomNavigation({
    super.key,
    required this.animation,
    required this.selectedIndex,
    this.onDestinationSelected,
  });

  final BarAnimation animation;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return MyBottomBarTransition(
      animation: animation,
      //backgroundColor: backgroundColor,
      child: NavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        // TODO change to background
        destinations:
            getBottomNavigationDestinations().map<NavigationDestination>((d) {
          return NavigationDestination(
            icon: d.icon,
            label: d.label,
          );
        }).toList(),
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
