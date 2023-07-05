import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:learnengo/Helpers/Nav_Helper.dart';
import 'package:learnengo/Screens/MainMenu.dart';
import 'package:learnengo/Screens/login/loginScreen.dart';
import 'package:learnengo/Screens/welcomeScreen.dart';
import 'package:learnengo/enums.dart';

import '../CachedController.dart';
import '../Widget/app_Icon.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> with Nav_Helper {
  @override
  void initState() {
    super.initState();
    bool autoLogin =
        CachedController.cache.getData(sharedPrefrencesKeys.autoLogin) ?? false;
    bool noBoarding =
        CachedController.cache.getData(sharedPrefrencesKeys.noBoarding) ??
            false;
    Future.delayed(
        const Duration(seconds: 4),
        () => jump(
            context,
            autoLogin
                ? const MainMenu()
                : noBoarding
                    ? const loginScreen()
                    : const welcomeScreen(),
            replace: true));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 220.h),
              const app_Icon(), // This is a custom widget that should returns the app_icon but with added border radius (Didn't work to import it as an SVG)
              SizedBox(height: 40.h),
              Text(
                'LearnEngo',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 183.h),
              SpinKitFadingCircle(color: Theme.of(context).colorScheme.primary)
            ],
          ),
        ),
      ),
    );
  }
}
