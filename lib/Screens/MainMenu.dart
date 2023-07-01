import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnengo/Helpers/Nav_Helper.dart';
import 'package:learnengo/Screens/MainScreenViews/AccountView.dart';
import 'package:learnengo/Screens/MainScreenViews/DictionaryView.dart';
import 'package:learnengo/Screens/MainScreenViews/HomeView.dart';
import 'package:learnengo/Screens/MainScreenViews/ProgressView.dart';
import 'package:learnengo/Screens/MainScreenViews/RankingView.dart';
import 'package:learnengo/Screens/login/loginScreen.dart';
import 'package:learnengo/Widget/bottomNavbarIcon.dart';
import 'package:learnengo/Widget/endDrawerItem.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ThemeProvider.dart';

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

class _MainMenuState extends State<MainMenu> with Nav_Helper {
  setBoolData(String key, bool data) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(key, data);
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    return Scaffold(
      endDrawer: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        width: MediaQuery.of(context).size.width / 1.3,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ListView(
            children: [
              SizedBox(height: 33.h),
              Text(appLocale.settings,
                  style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: 24.h),
              endDrawerItem(
                icon: Icons.person,
                buttonText: appLocale.profile,
                buttonColor: const Color(0xff112D74),
                iconColor: const Color(0xff3A6AE2),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              SizedBox(height: 20.h),
              endDrawerItem(
                icon: Icons.notifications,
                buttonText: appLocale.notification,
                buttonColor: const Color(0xffFCEDED),
                iconColor: const Color(0xffE23A3A).withOpacity(.7),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              SizedBox(height: 20.h),
              endDrawerItem(
                icon: Icons.remove_red_eye,
                buttonText: appLocale.darkMode,
                buttonColor: const Color(0xffEFFCED),
                iconColor: const Color(0xff50E23A),
                trailing: Consumer<ThemeProvider>(
                  builder: (context, provider, child) {
                    return Switch(
                      value: isDark,
                      onChanged: (bool value) {
                        if (value) {
                          provider.changeTheme('dark');
                        } else {
                          provider.changeTheme('light');
                        }
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              endDrawerItem(
                icon: Icons.phone,
                buttonText: appLocale.contactUs,
                buttonColor: const Color(0xffFCF9ED),
                iconColor: const Color(0xffE2C03A),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              SizedBox(height: 20.h),
              endDrawerItem(
                icon: Icons.question_mark_outlined,
                buttonText: appLocale.contactUs,
                buttonColor: const Color(0xffF4EDFC),
                iconColor: const Color(0xff8124F8),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              SizedBox(height: 20.h),
              endDrawerItem(
                icon: Icons.question_mark_outlined,
                buttonText: appLocale.logOut,
                buttonColor: const Color(0xffF4EDFC),
                iconColor: const Color(0xff8124F8),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(appLocale.logOutDialogTitle),
                      content: Expanded(
                        child: Text(
                          appLocale.logOutConfirmMsg,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(appLocale.no),
                        ),
                        TextButton(
                          onPressed: () {
                            setBoolData('autoLogin', false);
                            jump(context, const loginScreen(), replace: true);
                          },
                          child: Text(appLocale.yes),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
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
