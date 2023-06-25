import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnengo/Helpers/Nav_Helper.dart';
import 'package:learnengo/Screens/login/loginScreen.dart';
import 'package:learnengo/Widget/My_Button.dart';

class welcomeAfterSignUp extends StatelessWidget with Nav_Helper {
  const welcomeAfterSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(
                'assets/images/svgs/02.svg',
                width: 160.w,
                height: 160.h,
              ),
              SizedBox(height: 40.h),
              Text(
                appLocale.welcomeMSG,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.h),
              Text(appLocale.accountSuccessful,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      color: Theme.of(context).colorScheme.inversePrimary)),
              const Spacer(),
              My_Button(
                buttonText: appLocale.continueBTNText,
                onTap: () => jump(context, const loginScreen()),
              ),
              SizedBox(height: 34.h)
            ],
          ),
        ),
      ),
    );
  }
}
