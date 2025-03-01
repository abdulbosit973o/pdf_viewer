import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:pdf_viewer/config/theme/color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../config/theme/app_colors.dart';
import '../../../../../core/style/text_styles.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final screens = [
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];
  List<TabItem> items = [
    TabItem(
      icon: CupertinoIcons.home,
      title: 'Home',
    ),
    TabItem(
      icon: CupertinoIcons.device_desktop,
      title: 'Prayer Times',
    ),
    TabItem(
      icon: CupertinoIcons.bolt_fill,
      title: 'Discover',
    ),
    TabItem(
      icon: Icons.settings_outlined,
      title: 'Settings',
    ),
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomBarDefault(
        items: items,
        backgroundColor: Theme.of(context).colorScheme.bottomNavBarColor,
        color: Theme.of(context).colorScheme.textColor,
        colorSelected: AppColors.primary,
        indexSelected: selectedIndex,
        iconSize: 24,
        titleStyle: pregular.copyWith(
            fontSize: 12, color: Theme.of(context).colorScheme.textColor),
        countStyle: CountStyle(
            textStyle: pmedium.copyWith(
                fontSize: 16, color: Theme.of(context).colorScheme.textColor)),
        // highlightStyle: const HighlightStyle(
        //     sizeLarge: true, isHexagon: true, elevation: 2),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
