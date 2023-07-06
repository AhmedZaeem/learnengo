import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../modules/RankingModule.dart';
import '../../temp.dart';

class RankingView extends StatefulWidget {
  const RankingView({super.key});

  @override
  State<RankingView> createState() => _RankingViewState();
}

class _RankingViewState extends State<RankingView> {
  int selectedItem = 0;
  List<RankingModule> profiles = [
    RankingModule(
        'https://www.telegraph.co.uk/content/dam/news/2023/05/01/TELEMMGLPICT000333802380_trans_NvBQzQNjv4BqrfzZskasdHxLRTTh7do0m47e1lkwS0JKUaHflh0HnsI.jpeg?imwidth=960',
        'John Cross',
        900),
    RankingModule(
        'https://qodebrisbane.com/wp-content/uploads/2019/07/This-is-not-a-person-2-1.jpeg',
        'Maria Tomas',
        860),
    RankingModule(profile1, name, 780),
    RankingModule(
        'https://st3.depositphotos.com/3776273/35654/i/600/depositphotos_356542856-stock-photo-count-on-me-confident-good.jpg',
        'Marta Bears',
        632),
    RankingModule(
        'https://images.drive.com.au/driveau/image/upload/c_fill,f_auto,g_auto,h_540,q_auto:good,w_960/v1/cms/uploads/lnJABrISf2fgxjG0krZQ',
        'Elon Zuckerberg',
        621),
  ];
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    List listViewItems = [
      appLocale.weekly,
      appLocale.monthly,
      appLocale.allTime
    ];
    return Container(
      width: double.infinity,
      color: Theme.of(context).colorScheme.primary,
      padding: EdgeInsetsDirectional.only(start: 24.w, end: 24.w, top: 52.h),
      child: Stack(
        children: [
          Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  appLocale.ranking,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
                Icon(
                  Icons.notifications_none,
                  size: 24.h,
                  color: Colors.white,
                ),
              ]),
              SizedBox(height: 20.h),
              Stack(
                children: [
                  SizedBox(
                    height: 40.h,
                    child: Center(
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => setState(() => selectedItem = index),
                              child: Container(
                                width: 98.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Text(
                                  listViewItems[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        fontSize: 14.sp,
                                        color: selectedItem == index
                                            ? Theme.of(context)
                                                .colorScheme
                                                .primary
                                            : Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                      ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(width: 16.w);
                          },
                          itemCount: listViewItems.length),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 18.h),
          _buildRankWidget(1),
          _buildRankWidget(2),
          _buildRankWidget(3),
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            maxChildSize: .85,
            minChildSize: 0.5,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.r)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 5.h),
                    SizedBox(
                      width: 60.w,
                      child: Divider(
                        thickness: 5.h,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                          physics: const ClampingScrollPhysics(),
                          controller: scrollController,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                index > 2
                                    ? Text('${index + 1}')
                                    : SvgPicture.asset(
                                        'assets/images/svgs/rank${index + 1}.svg'),
                                CircleAvatar(
                                  radius: 30.h,
                                  backgroundImage:
                                      NetworkImage(profiles[index].imageUrl),
                                ),
                                SizedBox(
                                  width: 97.w,
                                  child: Text(
                                    profiles[index].name,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: profiles[index].name == name
                                              ? Theme.of(context)
                                                  .colorScheme
                                                  .primary
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .inversePrimary,
                                        ),
                                  ),
                                ),
                                Text('${profiles[index].xp} XP'),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider(
                              height: 40.h,
                              thickness: 1.w,
                              indent: 20.w,
                              endIndent: 20.w,
                              color: Theme.of(context).colorScheme.onSurface,
                            );
                          },
                          itemCount: profiles.length),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _buildRankWidget(int rank) {
    return Stack(
      children: [
        PositionedDirectional(
          top: rank == 1
              ? 115.h
              : rank == 2
                  ? 150.h
                  : 180.h,
          start: rank == 1
              ? 135.w
              : rank == 2
                  ? 25.w
                  : 225.w,
          child: Column(
            children: [
              CircleAvatar(
                radius: 24.h,
                backgroundImage: NetworkImage(profiles[rank - 1].imageUrl),
              ),
              SizedBox(height: 8.h),
              Text(
                profiles[rank - 1].name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        PositionedDirectional(
          top: rank == 1
              ? 180.h
              : rank == 2
                  ? 210.h
                  : 232.h,
          start: rank == 1
              ? 115.w
              : rank == 2
                  ? 15.w
                  : 220.w,
          child: SizedBox(
            height: 80.h,
            width: rank == 3
                ? 90.w
                : rank == 2
                    ? 99.w
                    : 105.w,
            child: SvgPicture.asset('assets/images/svgs/top$rank.svg'),
          ),
        ),
        PositionedDirectional(
            top: rank == 1
                ? 230.h
                : rank == 2
                    ? 260.h
                    : 280.h,
            start: rank == 1
                ? 115.w
                : rank == 2
                    ? 15.w
                    : 220.w,
            child: Container(
              height: 124.h,
              width: rank == 3
                  ? 90.w
                  : rank == 2
                      ? 99.w
                      : 105.w,
              color: rank == 1
                  ? const Color(0xffFAAE57)
                  : rank == 2
                      ? const Color(0xff688DE9)
                      : const Color(0xffE9CF68),
            )),
        PositionedDirectional(
            top: rank == 1
                ? 255.h
                : rank == 2
                    ? 275.h
                    : 286.h,
            start: rank == 1
                ? 140.w
                : rank == 2
                    ? 40.w
                    : 235.w,
            child: Column(
              children: [
                Text(
                  rank == 1
                      ? '1st'
                      : rank == 2
                          ? '2nd'
                          : '3rd',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 7.h),
                Container(
                  height: 22.h,
                  width: 55.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    '${profiles[rank - 1].xp} XP',
                    style: TextStyle(
                      color: rank == 1
                          ? const Color(0xffFAAE57)
                          : rank == 2
                              ? const Color(0xff688DE9)
                              : const Color(0xffE9CF68),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }

  int height = 120;
}
