import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class boarding_four extends StatelessWidget {
  const boarding_four({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    return Container(
      margin: EdgeInsets.only(top: 27.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(width: 1.w, color: const Color(0xffBDC0C7)),
      ),
      padding: EdgeInsetsDirectional.only(
          start: 22.w, top: 23.h, bottom: 20.h, end: 40.w),
      child: Column(
        children: [
          _element(context,
              title: appLocale.justForFun,
              subTitle: appLocale.stressFree,
              icon: 'chart'),
          _element(context,
              title: appLocale.masteringALotOfVocabulary,
              subTitle: appLocale.wordPhrases,
              icon: 'description'),
          _element(context,
              title: appLocale.cultivateStudyHabits,
              subTitle: appLocale.smartRemindersFunChallengesAndMore,
              icon: 'clock',
              lastOne: true),
        ],
      ),
    );
  }

  Widget _element(BuildContext context,
      {required String icon,
      required String title,
      required String subTitle,
      lastOne = false}) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/images/svgs/$icon.svg'),
            SizedBox(width: 14.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subTitle,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
        lastOne
            ? const SizedBox.shrink()
            : Divider(
                height: 40.h,
                thickness: .5,
                color: const Color(0xffBDC0C7),
              )
      ],
    );
  }
}
