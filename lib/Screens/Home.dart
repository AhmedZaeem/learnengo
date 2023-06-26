import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnengo/Widget/bottomNavbarIcon.dart';
import 'package:learnengo/Widget/gridViewItem.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ThemeProvider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

int index = 1;
bool show = false;
int selectedLanguage = 0;
setBoolData(String key, bool data) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool(key, data);
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavBar,
      body: Column(
        children: [
          Stack(children: [
            Container(
              padding:
                  EdgeInsetsDirectional.only(top: 52.h, start: 24.w, end: 24.w),
              height: 143.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadiusDirectional.only(
                    bottomStart: Radius.circular(16.r),
                    bottomEnd: Radius.circular(16.r)),
              ),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    child: Container(
                      width: 32.w,
                      height: 32.h,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 1.w,
                          color: Colors.white,
                        ),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/svgs/US.svg',
                        fit: BoxFit.cover,
                        width: 24.h,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Consumer<ThemeProvider>(builder: (context, provider, child) {
                    return InkWell(
                      onTap: () {
                        if (Theme.of(context).brightness == Brightness.light) {
                          provider.changeTheme('dark');
                        } else if (Theme.of(context).brightness ==
                            Brightness.dark) {
                          provider.changeTheme('light');
                        } else {
                          provider.changeTheme('system');
                        }
                      },
                      child: SvgPicture.asset(
                        'assets/images/svgs/themeChange.svg',
                        color: Colors.white,
                        width: 32.w,
                        height: 32.h,
                      ),
                    );
                  }),
                  SizedBox(width: 16.w),
                  SvgPicture.asset(
                    'assets/images/svgs/streak.svg',
                    width: 32.w,
                    height: 32.h,
                  ),
                  SizedBox(width: 16.w),
                  SvgPicture.asset(
                    'assets/images/svgs/notification.svg',
                    width: 32.w,
                    height: 32.h,
                  ),
                ],
              ),
            ),
            show
                ? PositionedDirectional(
                    top: 130.h,
                    start: 27.w,
                    child: SvgPicture.asset(
                      'assets/images/svgs/polygon.svg',
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: 17.w,
                      height: 16.h,
                    ),
                  )
                : const SizedBox.shrink(),
          ]),
          show
              ? SizedBox(
                  height: 136.h,
                  child: GridView.count(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    crossAxisCount: 3,
                    mainAxisSpacing: 4.h,
                    crossAxisSpacing: 16.w,
                    childAspectRatio: 1.2,
                    children: [
                      gridViewItem(
                        flag: 'US',
                        onTap: () {
                          setState(() {
                            index = 1;
                          });
                        },
                        language: 'English',
                        selectedIndex: index,
                        itemIndex: 1,
                      ),
                      gridViewItem(
                        flag: 'KR',
                        onTap: () {
                          setState(() {
                            index = 2;
                          });
                        },
                        language: 'Korean',
                        selectedIndex: index,
                        itemIndex: 2,
                      ),
                      gridViewItem(
                          flag: 'addLanguage',
                          language: 'Add',
                          selectedIndex: index,
                          iconSize: '',
                          borderColor: Theme.of(context).colorScheme.onSurface,
                          itemIndex: -1),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
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
