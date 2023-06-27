import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnengo/Helpers/Nav_Helper.dart';
import 'package:learnengo/Screens/login/loginScreen.dart';
import 'package:learnengo/Screens/onBoarding/onBoardingScreen.dart';
import 'package:learnengo/Widget/My_Button.dart';

import '../Widget/app_Icon.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({super.key});

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> with Nav_Helper {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocale = AppLocalizations.of(context)!;
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
              SizedBox(height: 8.h),
              Text(
                appLocale.mainScreenText,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              My_Button(
                  buttonText: appLocale.getStarted,
                  onTap: () => jump(context, const onBoardingScreen())),
              SizedBox(height: 20.h),
              My_Button(
                buttonText: appLocale.iAlreadyHaveAnAccount,
                textColor: Theme.of(context).colorScheme.primary,
                buttonColor: Theme.of(context).colorScheme.onTertiary,
                onTap: () => jump(context, const loginScreen()),
              ),
              SizedBox(height: 62.h),
            ],
          ),
        ),
      ),
    );
  }
}
