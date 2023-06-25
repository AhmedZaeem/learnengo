import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnengo/Widget/CustomSelectorBTN.dart';

class boarding_one extends StatelessWidget {
  const boarding_one({super.key});
  static const List<String> countries = [
    'English',
    'Indonesia',
    'Hindi',
    'Korean',
  ];
  static const List<String> countriesFlags = [
    'US',
    'MC',
    'IN',
    'KR',
  ];
  @override
  Widget build(BuildContext context) {
    AppLocalizations applocale = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          applocale.iSpeak,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: 16.h),
        CustomSelectorBTN(
          btnText: 'Vietnamese',
          svgIconName: 'vnFlag',
          canBeUnSelected: false,
          isSelected: true,
          trailing: 'Placeholder',
        ),
        SizedBox(height: 24.h),
        Text(
          applocale.iWantToLearnLanguage,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(height: 16.h),
        SizedBox(
          height: 260.h,
          child: ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: countries.length,
            itemBuilder: (_, i) => CustomSelectorBTN(
                btnText: countries[i], svgIconName: countriesFlags[i]),
            separatorBuilder: (_, __) => SizedBox(height: 16.h),
          ),
        )
      ],
    );
  }
}
