import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'CustomSelectorBTN.dart';

class socialMediaLogin extends StatelessWidget {
  const socialMediaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    var svg = ['facebook', 'google', 'apple'];
    var btnText = [
      appLocale.signInWithFacebook,
      appLocale.signInWithGoogle,
      appLocale.signInWithApple
    ];
    return Column(children: [
      Row(
        children: [
          Expanded(
            child: Divider(
              color: Theme.of(context).colorScheme.inversePrimary,
              endIndent: 10.w,
              indent: 60.w,
              thickness: 1,
            ),
          ),
          Text(appLocale.or),
          Expanded(
            child: Divider(
              indent: 10.w,
              endIndent: 60.w,
              color: Theme.of(context).colorScheme.inversePrimary,
              thickness: 1,
            ),
          ),
        ],
      ),
      ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => CustomSelectorBTN(
          btnText: btnText[index],
          svgIconName: svg[index],
          svgColor:
              index == 2 ? Theme.of(context).colorScheme.inversePrimary : null,
          customMethod: () {},
        ),
        separatorBuilder: (context, index) => index == svg.length - 1
            ? const SizedBox.shrink()
            : SizedBox(height: 20.h),
        itemCount: svg.length,
      ),
    ]);
  }
}
