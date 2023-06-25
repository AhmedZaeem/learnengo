import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Widget/CustomSelectorBTN.dart';

class boarding_three extends StatefulWidget {
  const boarding_three({super.key});

  @override
  State<boarding_three> createState() => _boarding_threeState();
}

class _boarding_threeState extends State<boarding_three> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    return Column(
      children: [
        CustomSelectorBTN(
          btnText: appLocale.justForFun,
          svgIconName: 'smile',
          customMethod: () {
            setState(() {
              selected = 1;
            });
          },
          isSelected: selected == 1,
        ),
        SizedBox(height: 16.h),
        CustomSelectorBTN(
          btnText: appLocale.improveMyCareer,
          svgIconName: 'bag',
          customMethod: () {
            setState(() {
              selected = 2;
            });
          },
          isSelected: selected == 2,
        ),
        SizedBox(height: 16.h),
        CustomSelectorBTN(
          btnText: appLocale.supportMyEducation,
          svgIconName: 'cap',
          customMethod: () {
            setState(() {
              selected = 3;
            });
          },
          isSelected: selected == 3,
        ),
        SizedBox(height: 16.h),
        CustomSelectorBTN(
          btnText: appLocale.vacationPreparation,
          svgIconName: 'plane',
          customMethod: () {
            setState(() {
              selected = 4;
            });
          },
          isSelected: selected == 4,
        ),
        SizedBox(height: 16.h),
        CustomSelectorBTN(
          btnText: appLocale.othersReason,
          svgIconName: 'plugin',
          customMethod: () {
            setState(() {
              selected = 5;
            });
          },
          isSelected: selected == 5,
        ),
      ],
    );
  }
}
