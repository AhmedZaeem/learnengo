import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class StatisticsView extends StatelessWidget {
  final String icon;
  final String title;
  final String subTitle;
  final bool hasBorder;
  final TextStyle? mainTextStyle;
  final TextStyle? subTextStyle;
  const StatisticsView(
      {super.key,
      this.subTextStyle,
      this.mainTextStyle,
      this.hasBorder = false,
      required this.title,
      required this.icon,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76.h,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(12.r),
        border: hasBorder
            ? Border.all(
                width: 1,
                color: Theme.of(context).colorScheme.onBackground,
              )
            : Border.all(),
      ),
      child: Row(
        children: [
          SizedBox(width: 20.w),
          SvgPicture.asset(
            'assets/images/svgs/$icon.svg',
            height: 30.h,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: mainTextStyle ?? Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  subTitle,
                  style: subTextStyle ??
                      Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontSize: 20.sp),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
