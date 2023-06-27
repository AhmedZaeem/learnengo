import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnengo/Screens/MainScreenViews/AccountView.dart';
import 'package:learnengo/Screens/MainScreenViews/DictionaryView.dart';
import 'package:learnengo/Screens/MainScreenViews/HomeView.dart';
import 'package:learnengo/Screens/MainScreenViews/ProgressView.dart';
import 'package:learnengo/Screens/MainScreenViews/RankingView.dart';
import 'package:learnengo/Widget/bottomNavbarIcon.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

int index = 0;
setBoolData(String key, bool data) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool(key, data);
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavBar,
      body: const [
        HomeView(),
        ProgressView(),
        RankingView(),
        DictionaryView(),
        AccountView(),
      ][index],
    );
  }

  Widget get _buildBottomNavBar => BottomNavigationBar(
        currentIndex: index,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedLabelStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600),
        onTap: (value) => setState(() => index = value),
        iconSize: 24.w,
        items: [
          BottomNavigationBarItem(
              icon: bottomNavbarIcon(
                  position: 0, indexPosition: index, svg: 'home'),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: bottomNavbarIcon(
                  position: 1, indexPosition: index, svg: 'dashboard'),
              label: 'Progress'),
          BottomNavigationBarItem(
              icon: bottomNavbarIcon(
                  position: 2, indexPosition: index, svg: 'rank'),
              label: 'Ranking'),
          BottomNavigationBarItem(
              icon: bottomNavbarIcon(
                  position: 3, indexPosition: index, svg: 'search'),
              label: 'Dictionary'),
          BottomNavigationBarItem(
              icon: bottomNavbarIcon(
                  position: 4, indexPosition: index, svg: 'profile'),
              label: 'Account'),
        ],
      );
}
