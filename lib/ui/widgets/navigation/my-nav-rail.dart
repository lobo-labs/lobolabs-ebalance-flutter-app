import 'package:flutter/material.dart';
import 'package:lobolabs_ebalance_flutter_app/destination.dart';
import 'package:lobolabs_ebalance_flutter_app/ui/animations/my-fab-animation.dart';
import 'package:lobolabs_ebalance_flutter_app/ui/transitions/my-nav-rail-transition.dart';

import '../../../animation.dart';

class MyNavigationRail extends StatelessWidget {
  const MyNavigationRail({
    super.key,
    required this.animation,
    required this.fabAnimation,
    //required this.backgroundColor,
    required this.selectedIndex,
    this.onDestinationSelected,
  });

  final RailAnimation animation;
  final RailFabAnimation fabAnimation;

  //final Color backgroundColor;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    // final colorScheme = Theme.of(context).colorScheme;
    return MyNavRailTransition(
      animation: animation,
      //backgroundColor: backgroundColor,
      child: NavigationRail(
        selectedIndex: selectedIndex,
        //backgroundColor: backgroundColor,
        onDestinationSelected: onDestinationSelected,
        leading: Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
            const SizedBox(height: 8),
            MyFabAnimation(
              animation: fabAnimation,
              elevation: 0,
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          ],
        ),
        groupAlignment: -0.85,
        destinations: getRailDestinations(false).map((d) {
          return NavigationRailDestination(
            icon: d.icon,
            label: Text(d.label),
          );
        }).toList(),
      ),
    );
  }
}
