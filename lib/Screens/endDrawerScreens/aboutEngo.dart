import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class aboutEngo extends StatelessWidget {
  const aboutEngo({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    List texts = [
      appLocale.ourBlog,
      appLocale.ourMethod,
      appLocale.privacyPolicy,
      appLocale.accessibility,
      appLocale.feedback,
      appLocale.rateUs,
      appLocale.followUsOnFacebook,
      appLocale.followUsOnInstagram,
      appLocale.followUsOnTwitter,
      appLocale.shareEngo,
    ];
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 52.h),
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                SizedBox(width: 12.w),
                Text(
                  appLocale.aboutEngo,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          texts[index],
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20.h);
                },
                itemCount: texts.length),
          ],
        ),
      ),
    );
  }
}
