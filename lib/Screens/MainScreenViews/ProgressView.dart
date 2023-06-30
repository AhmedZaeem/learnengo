import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnengo/Widget/statisticsView.dart';
import 'package:learnengo/modules/profileButton.dart';
import 'package:learnengo/temp.dart';

class ProgressView extends StatefulWidget {
  const ProgressView({super.key});

  @override
  State<ProgressView> createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    List<progressButton> buttons = [
      progressButton(
          icon: 'books',
          title: appLocale.learn,
          subTitle: appLocale.onBackTermsAndDefinitions),
      progressButton(
          icon: 'exam',
          title: appLocale.exam,
          subTitle: appLocale.takeAMockTest),
      progressButton(
          icon: 'egame',
          title: appLocale.games,
          subTitle: appLocale.reviewingKnowledgeThroughGames),
    ];
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(16.r),
                bottomStart: Radius.circular(16.r)),
            color: Theme.of(context).colorScheme.primary,
          ),
          padding: EdgeInsetsDirectional.only(
              top: 53.h, bottom: 22.h, start: 24.w, end: 24.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    appLocale.progress,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_none,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  )
                ],
              ),
              SizedBox(height: 21.h),
              Container(
                height: 100.h,
                width: 100.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).scaffoldBackgroundColor),
                child:
                    CachedNetworkImage(imageUrl: profile1, fit: BoxFit.cover),
              ),
              SizedBox(height: 12.h),
              Text(
                name,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
              ),
              SizedBox(height: 2.h),
              Text(
                level,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).scaffoldBackgroundColor),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  statisticsView(
                      icon: 'flash', title: appLocale.totalXP, subTitle: '76%'),
                  SizedBox(width: 16.w),
                  statisticsView(
                      icon: 'alarm',
                      title: appLocale.studyTime,
                      subTitle: '50'),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(16.r),
                  child: Container(
                    height: 80.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        width: 1.w,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 21.w),
                        SvgPicture.asset(
                          'assets/images/svgs/${buttons[index].icon}.svg',
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        SizedBox(width: 13.w),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(end: 20.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  buttons[index].title,
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                Text(
                                  buttons[index].subTitle,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 20.h);
              },
              itemCount: buttons.length),
        )
      ],
    );
  }
}
