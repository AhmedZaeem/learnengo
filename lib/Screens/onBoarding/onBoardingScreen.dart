import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learnengo/Helpers/Nav_Helper.dart';
import 'package:learnengo/Screens/onBoarding/subScreens/boarding_five.dart';
import 'package:learnengo/Screens/onBoarding/subScreens/boarding_four.dart';
import 'package:learnengo/Screens/onBoarding/subScreens/boarding_one.dart';
import 'package:learnengo/Screens/onBoarding/subScreens/boarding_three.dart';
import 'package:learnengo/Screens/onBoarding/subScreens/boarding_two.dart';
import 'package:learnengo/Screens/onBoardingFinish.dart';
import 'package:learnengo/Widget/My_Button.dart';

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({super.key});

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> with Nav_Helper {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    final boardString = [
      appLocale.onBoardOneText,
      appLocale.onBoardTwoText,
      appLocale.onBoardThreeText,
      appLocale.onBoardFourText,
      appLocale.onBoardFiveText,
    ];
    double width = 250;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.h),
        child: Column(
          children: [
            SizedBox(height: 59.h),
            Row(children: [
              IconButton(
                  onPressed: () {
                    if (index == 0) {
                      Navigator.pop(context);
                    } else {
                      setState(() {
                        index--;
                      });
                    }
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              SizedBox(
                  width: 12
                      .w), // This is not the same width taken from the Figma file but a better one

              Container(
                width: width.w,
                height: 12.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Theme.of(context).colorScheme.onPrimary),
                child: Container(
                  margin: EdgeInsetsDirectional.only(
                      end: (width - (width * (index + 1) / 5)).w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Theme.of(context).colorScheme.primary),
                ),
              )
            ]),
            Row(children: [
              SvgPicture.asset(
                'assets/images/svgs/03.svg',
                height: 140.h,
                width: 140.w,
              ),
              Stack(
                children: [
                  SvgPicture.asset(
                    'assets/images/svgs/07.svg',
                    width: 182.w,
                  ),
                  PositionedDirectional(
                    top: 59.h,
                    bottom: 0,
                    start: 24.w,
                    end: 0,
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(end: 36.w),
                      child: Text(
                        boardString[index],
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.background),
                      ),
                    ),
                  )
                ],
              )
            ]),
            const [
              boarding_one(),
              boarding_two(),
              boarding_three(),
              boarding_four(),
              boarding_five(),
            ][index],
            const Spacer(),
            My_Button(
              buttonText: appLocale.continueBTNText,
              onTap: () {
                if (index < 4) {
                  setState(() {
                    index++;
                  });
                } else {
                  jump(context, const onBoardingFinish(), replace: true);
                }
              },
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
