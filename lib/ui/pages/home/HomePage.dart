import 'package:flutter/material.dart';

import '../../../animation.dart';
import '../../animations/my-fab-animation.dart';
import '../../widgets/navigation/my-bottom-nav.dart';
import '../../widgets/navigation/my-nav-rail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.isAdmin});

  final bool isAdmin;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      reverseDuration: const Duration(milliseconds: 1250),
      value: 0,
      vsync: this);

  late final _railAnimation = RailAnimation(parent: _controller);
  late final _fabAnimation = RailFabAnimation(parent: _controller);
  late final _bottomBarAnimation = BarAnimation(parent: _controller);

  int selectedIndex = 0;
  bool controllerInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final double width = MediaQuery.of(context).size.width;

    final AnimationStatus status = _controller.status;

    if (width > 600) {
      if (status != AnimationStatus.forward &&
          status != AnimationStatus.completed) {
        _controller.forward();
      }
    } else {
      if (status != AnimationStatus.reverse &&
          status != AnimationStatus.dismissed) {
        _controller.reverse();
      }
    }
    if (!controllerInitialized) {
      controllerInitialized = true;
      _controller.value = width > 600 ? 1 : 0;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // late final _colorScheme = Theme.of(context).colorScheme;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Scaffold(
            body: Row(
              children: [
                MyNavigationRail(
                  animation: _railAnimation,
                  fabAnimation: _fabAnimation,
                  selectedIndex: selectedIndex,
                  //backgroundColor: _backgroundColor,
                  onDestinationSelected: (index) {
                    _onSelectIndex(index);
                  },
                ),
                Expanded(child: Container()), // TODO incluir tela
              ],
            ),
            floatingActionButton: MyFabAnimation(
              // backgroundColor: _colorScheme.tertiaryContainer,
              // foregroundColor: _colorScheme.onTertiaryContainer,
              animation: _bottomBarAnimation,
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
            bottomNavigationBar: MyBottomNavigation(
              animation: _bottomBarAnimation,
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                _onSelectIndex(index);
              },
            ));
      },
    );
  }

  _onSelectIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
