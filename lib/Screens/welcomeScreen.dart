import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnengo/Widget/My_Button.dart';

import '../Widget/app_Icon.dart';

class welcomeScreen extends StatefulWidget {
  const welcomeScreen({super.key});

  @override
  State<welcomeScreen> createState() => _welcomeScreenState();
}

class _welcomeScreenState extends State<welcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocale = AppLocalizations.of(context)!;
    return Scaffold(
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
                    color: Theme.of(context).primaryColor,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              Text(
                appLocale.mainScreenText,
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: const Color(0xff26272C), fontSize: 16.sp),
              ),
              SizedBox(height: 106.h),
              My_Button(buttonText: appLocale.getStarted),
              SizedBox(height: 20.h),
              My_Button(
                buttonText: appLocale.iAlreadyHaveAnAccount,
                textColor: Theme.of(context).primaryColor,
                buttonColor: Color(0xffEDF2FC),
              )
            ],
          ),
        ),
      ),
    );
  }
}
