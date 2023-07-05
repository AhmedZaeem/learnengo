import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learnengo/modules/countriesModule.dart';
import 'package:learnengo/modules/levelModule.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../ThemeProvider.dart';
import '../../Widget/gridViewItem.dart';
import '../../Widget/levelWidget.dart';
import '../../Widget/nexLevel.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool show = false;
  bool streakShow = false;
  List<countriesModule> availableCountries = [
    countriesModule('Korean', 'KR'),
    countriesModule('Indian', 'IN'),
    countriesModule('Indonesian', 'MC'),
  ];
  int numOfCountries = 0;
  List<countriesModule> selectedCountries = [countriesModule('English', 'US')];
  int selectedLanguage = 0;
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    List<String> levelsTitle = [
      appLocale.level1,
      appLocale.level2,
      appLocale.level3,
      appLocale.level4,
      appLocale.level5,
      appLocale.level6,
      appLocale.level7,
      appLocale.level8,
      appLocale.level9,
      appLocale.level10,
      appLocale.level11,
      appLocale.level12,
      appLocale.level13,
      appLocale.level14,
      appLocale.level15,
    ];
    List<levelModule> appLevels = List.generate(
      15,
      (index) {
        return levelModule(
          icon: 'level${index + 1}',
          enabled: index < 5,
          levelTitle: levelsTitle[index],
          subLevelsCount: '0/4',
        );
      },
    );
    return [
      Column(
        children: [
          _buildAppBar,
          Expanded(
            child: Container(
              color: show ? Colors.black.withOpacity(.3) : Colors.transparent,
              child: SingleChildScrollView(
                physics: show ? const NeverScrollableScrollPhysics() : null,
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 100.h),
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsetsDirectional.only(
                                end: index == 4 ? 220.w : 0,
                                start: index == 9 ? 200.w : 0,
                                top: index == 5 || index == 10 ? 106.h : 0),
                            child: SvgPicture.asset(
                              'assets/images/svgs/${index == 4 || index == 9 ? 'line' : index % 2 == 0 ? 'leftToRight' : 'rightToLeft'}.svg',
                              color: index == 4 || index == 9
                                  ? Colors.grey
                                  : Theme.of(context).colorScheme.primary,
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 80.h);
                        },
                        itemCount: 14,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return levelWidget(
                            index,
                            level: appLevels[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return index == 4
                              ? nextLevel(
                                  btnText: appLocale.skipAhead.toUpperCase(),
                                )
                              : index == 9
                                  ? nextLevel(
                                      btnText:
                                          appLocale.skipAhead.toUpperCase(),
                                      enabled: false)
                                  : SizedBox(height: 20.h);
                        },
                        itemCount: 15,
                      ),
                    ),
                    show ? _buildLanguageSelector : const SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAppBar,
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Text(
              'Challenges(day)',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(fontSize: 14.sp),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: width.w,
                height: 12.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Container(
                  margin: EdgeInsetsDirectional.only(
                      end: (width - (4 * (width / 14))).w),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              const Text('4/14'),
            ],
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                _buildStreakDetails(
                    icon: 'flag', title: '3 Days', details: appLocale.nextGoal),
                SizedBox(width: 15.w),
                _buildStreakDetails(
                    icon: 'fire',
                    title: '2 Days',
                    details: appLocale.daysStraight),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24.w),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface, width: 1.w),
            ),
            child: TableCalendar(
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  for (DateTime d in streaks) {
                    if (day == d) {
                      return Center(
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: Center(
                            child: Text(
                              '${day.day}',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      );
                    }
                  }
                  if (day == target) {
                    return Center(
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.grey.shade300,
                        child: Center(
                          child: Text(
                            '${day.day}',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                        ),
                      ),
                    );
                  }
                  return null;
                },
              ),
              headerStyle: HeaderStyle(
                headerPadding: EdgeInsets.symmetric(vertical: 10.h),
                formatButtonVisible: false,
                titleCentered: true,
              ),
              rowHeight: 32.h,
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay:
                  DateTime.utc(DateTime.now().year, DateTime.now().month + 1),
            ),
          )
        ],
      )
    ][streakShow ? 1 : 0];
  }

  var width = 250;
  final List<DateTime> streaks = [
    DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 1),
    DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day - 2),
  ];
  final DateTime target = DateTime.utc(
      DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
  Widget _buildStreakDetails(
      {required String title, required String details, required String icon}) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            width: 1.w,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 15.h),
            SvgPicture.asset('assets/images/svgs/$icon.svg'),
            SizedBox(height: 10.h),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              details,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12.h),
          ],
        ),
      ),
    );
  }

  Widget get _buildAppBar => Stack(children: [
        GestureDetector(
          onTap: () {
            setState(() {
              show = false;
            });
          },
          child: Container(
            padding:
                EdgeInsetsDirectional.only(top: 52.h, start: 24.w, end: 24.w),
            height: 143.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadiusDirectional.only(
                  bottomStart: Radius.circular(16.r),
                  bottomEnd: Radius.circular(16.r)),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      show = !show;
                    });
                  },
                  child: Container(
                    width: 32.w,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1.w,
                        color: Colors.white,
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/images/svgs/${selectedCountries[selectedLanguage].CountryFlag}.svg',
                      allowDrawingOutsideViewBox: true,
                      height: 42.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const Spacer(),
                Consumer<ThemeProvider>(builder: (context, provider, child) {
                  return InkWell(
                    onTap: () {
                      if (Theme.of(context).brightness == Brightness.light) {
                        provider.changeTheme('dark');
                      } else if (Theme.of(context).brightness ==
                          Brightness.dark) {
                        provider.changeTheme('light');
                      } else {
                        provider.changeTheme('system');
                      }
                    },
                    child: SvgPicture.asset(
                      'assets/images/svgs/themeChange.svg',
                      color: Colors.white,
                      width: 32.w,
                      height: 32.h,
                    ),
                  );
                }),
                SizedBox(width: 16.w),
                InkWell(
                  onTap: () => setState(() => streakShow = !streakShow),
                  child: SvgPicture.asset(
                    'assets/images/svgs/streak.svg',
                    width: 32.w,
                    height: 32.h,
                  ),
                ),
                SizedBox(width: 16.w),
                SvgPicture.asset(
                  'assets/images/svgs/notification.svg',
                  width: 32.w,
                  height: 32.h,
                ),
              ],
            ),
          ),
        ),
        streakShow
            ? PositionedDirectional(
                top: 130.h,
                end: 73.w,
                child: SvgPicture.asset(
                  'assets/images/svgs/polygon.svg',
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: 17.w,
                  height: 16.h,
                ),
              )
            : const SizedBox.shrink(),
        show
            ? PositionedDirectional(
                top: 130.h,
                start: 27.w,
                child: SvgPicture.asset(
                  'assets/images/svgs/polygon.svg',
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: 17.w,
                  height: 16.h,
                ),
              )
            : const SizedBox.shrink(),
      ]);
  Widget get _buildLanguageSelector => Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        height: 136.h,
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: numOfCountries + 2,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 4.h,
            crossAxisSpacing: 16.w,
            childAspectRatio: 1.2,
            crossAxisCount: 3,
          ),
          addAutomaticKeepAlives: true,
          itemBuilder: (BuildContext context, int index) {
            return index == selectedCountries.length
                ? gridViewItem(
                    flag: 'addLanguage',
                    language: 'Add',
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return availableCountries.isEmpty
                              ? const Center(
                                  child: Text('No more available languages'),
                                )
                              : Padding(
                                  padding: EdgeInsets.symmetric(vertical: 32.h),
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            selectedCountries
                                                .add(availableCountries[index]);
                                            availableCountries.removeAt(index);
                                            Navigator.pop(context);
                                            setState(() {
                                              numOfCountries++;
                                            });
                                          },
                                          child: Row(
                                            children: [
                                              SizedBox(width: 16.w),
                                              SvgPicture.asset(
                                                  'assets/images/svgs/${availableCountries[index].CountryFlag}.svg',
                                                  width: 32.w),
                                              SizedBox(width: 16.w),
                                              Text(
                                                availableCountries[index]
                                                    .LanguageName,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineSmall,
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          SizedBox(height: 32.h),
                                      itemCount: availableCountries.length),
                                );
                        },
                      );
                    },
                    selectedIndex: selectedLanguage,
                    iconSize: '',
                    borderColor: Theme.of(context).colorScheme.onSurface,
                    itemIndex: selectedLanguage,
                  )
                : gridViewItem(
                    flag: selectedCountries[index].CountryFlag,
                    language: selectedCountries[index].LanguageName,
                    selectedIndex: selectedLanguage,
                    itemIndex: index,
                    onTap: () {
                      setState(() {
                        selectedLanguage = index;
                      });
                    },
                  );
          },
        ),
      );
}
