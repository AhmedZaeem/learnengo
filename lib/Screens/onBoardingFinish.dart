import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learnengo/Helpers/Nav_Helper.dart';
import 'package:learnengo/Screens/login/loginScreen.dart';
import 'package:learnengo/Screens/register/Register.dart';

import '../Widget/My_Button.dart';

class onBoardingFinish extends StatefulWidget {
  const onBoardingFinish({super.key});

  @override
  State<onBoardingFinish> createState() => _onBoardingFinishState();
}

class _onBoardingFinishState extends State<onBoardingFinish> with Nav_Helper {
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
              SvgPicture.asset(
                'assets/images/svgs/01.svg',
                width: 160.w,
                height: 160.h,
              ),
              SizedBox(height: 40.h),
              Text(
                appLocale.createAnAccountNow,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const Spacer(),
              My_Button(
                  buttonText: appLocale.createProfile,
                  onTap: () => jump(context, const register())),
              SizedBox(height: 20.h),
              My_Button(
                buttonText: appLocale.skip,
                textColor: Theme.of(context).colorScheme.primary,
                buttonColor: Theme.of(context).colorScheme.secondary,
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
