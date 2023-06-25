import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnengo/Widget/CustomSelectorBTN.dart';

class boarding_five extends StatelessWidget {
  const boarding_five({super.key});
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    List<String> time = [
      appLocale.min5,
      appLocale.min10,
      appLocale.min15,
      appLocale.min30,
      appLocale.min60,
    ];
    List<String> trailing = [
      appLocale.placeholder,
      appLocale.normal,
      appLocale.serious,
      appLocale.great,
      appLocale.awesome,
    ];
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => CustomSelectorBTN(
              btnText: time[index],
              trailing: trailing[index],
              trailingColor: Theme.of(context).colorScheme.surface,
            ),
        separatorBuilder: (context, index) => SizedBox(height: 20.h),
        itemCount: time.length);
  }
}
