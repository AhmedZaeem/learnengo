import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnengo/Widget/languageSelector.dart';

class boarding_two extends StatefulWidget {
  const boarding_two({super.key});

  @override
  State<boarding_two> createState() => _boarding_twoState();
}

class _boarding_twoState extends State<boarding_two> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    return Column(
      children: [
        CustomSelectorBTN(
          btnText: appLocale.iJustStartedLearningEnglish,
          svgIconName: 'c1',
          customMethod: () {
            setState(() {
              selected = 1;
            });
          },
          isSelected: selected == 1,
        ),
        SizedBox(height: 32.h),
        CustomSelectorBTN(
          btnText: appLocale.iKnowSomeWordsAndPhrases,
          svgIconName: 'c2',
          customMethod: () {
            setState(() {
              selected = 2;
            });
          },
          isSelected: selected == 2,
        ),
        SizedBox(height: 32.h),
        CustomSelectorBTN(
          btnText: appLocale.iCanHaveASimpleConversation,
          svgIconName: 'c3',
          customMethod: () {
            setState(() {
              selected = 3;
            });
          },
          isSelected: selected == 3,
        ),
        SizedBox(height: 32.h),
        CustomSelectorBTN(
          btnText: appLocale.imAtIntermediateLevelOrAbove,
          svgIconName: 'c4',
          customMethod: () {
            setState(() {
              selected = 4;
            });
          },
          isSelected: selected == 4,
        ),
      ],
    );
  }
}
