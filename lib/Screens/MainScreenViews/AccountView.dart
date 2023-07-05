import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnengo/Helpers/ImagePickerHelper.dart';
import 'package:learnengo/Widget/My_Button.dart';
import 'package:learnengo/Widget/statisticsView.dart';
import 'package:learnengo/modules/statisticsViewModule.dart';

import '../../Widget/buildBottomSheetChoice.dart';
import '../../modules/FlTitles.dart';
import '../../temp.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> with ImagePickerHelper {
  File? myImage;
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    List<statisticsViewModule> statistics = [
      statisticsViewModule('streakIcon', '$challenge', appLocale.challenges),
      statisticsViewModule(
          'greenBookIcon', '$statisticsLevel', appLocale.level),
      statisticsViewModule('target', 'title', 'subTitle'),
      statisticsViewModule('top', 'title', 'subTitle'),
    ];
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
                icon: const Icon(
                  Icons.more_horiz,
                )),
          ]),
        ),
        SizedBox(height: 16.h),
        Align(
          alignment: Alignment.center,
          child: Stack(
            children: [
              Container(
                height: 100.h,
                width: 100.h,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).scaffoldBackgroundColor),
                child: myImage == null
                    ? CachedNetworkImage(imageUrl: profile1, fit: BoxFit.cover)
                    : Image.file(
                        myImage!,
                        fit: BoxFit.cover,
                      ),
              ),
              PositionedDirectional(
                start: 55.w,
                top: 65.h,
                child: IconButton(
                  onPressed: () async {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 70.h, horizontal: 30.w),
                          child: Row(
                            children: [
                              buildBottomSheetChoice(
                                  text: 'Camera',
                                  icon: Icons.camera,
                                  onTap: () async {
                                    var img = await pickImage(fromCamera: true);
                                    if (img != null) {
                                      setState(() {
                                        myImage = img;
                                      });
                                    }
                                    Navigator.pop(context);
                                  }),
                              SizedBox(width: 32.w),
                              buildBottomSheetChoice(
                                  text: 'Gallery',
                                  icon: Icons.photo_library,
                                  onTap: () async {
                                    var img = await pickImage();
                                    if (img != null) {
                                      setState(() {
                                        myImage = img;
                                      });
                                    }
                                    Navigator.pop(context);
                                  }),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.camera_alt,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Column(
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(height: 2.h),
            Text(
              joinedSince,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 46.w),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            _buildMyIconButton(icon: Icons.message_outlined),
            My_Button(
              buttonText: appLocale.addFriends,
              textPadding: 16.w,
              buttonRadius: 14,
            ),
            _buildMyIconButton(icon: Icons.share_outlined),
          ]),
        ),
        SizedBox(height: 28.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProfileStatus(
                  subText: appLocale.followers,
                  mainText: numOfFollowers,
                ),
                _buildProfileStatus(
                  subText: appLocale.following,
                  mainText: numOfFollowing,
                ),
                _buildProfileStatus(
                  isLast: true,
                  subText: appLocale.totalXP,
                  mainText: totalXP,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 22.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Text(
            appLocale.statistical,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: statistics.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2,
              crossAxisSpacing: 20.w,
              mainAxisSpacing: 20.h,
            ),
            itemBuilder: (context, index) {
              return StatisticsView(
                title: statistics[index].title,
                hasBorder: true,
                mainTextStyle: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontSize: 20.sp),
                subTextStyle: Theme.of(context).textTheme.bodySmall,
                icon: statistics[index].icon,
                subTitle: statistics[index].subTitle,
              );
            },
          ),
        ),
        SizedBox(height: 19.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    appLocale.overview,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                    '780XP',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Divider(
                indent: 10.w,
                endIndent: 10.w,
                height: 1.h,
                thickness: .5,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsetsDirectional.only(end: 20.w),
                child: SizedBox(
                  height: 270.h,
                  child: _buildChart,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget get _buildChart => LineChart(LineChartData(
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 6,
        titlesData: FlTitles.getFlTitles(),
        gridData: const FlGridData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: const [
              FlSpot(0, 2),
              FlSpot(0.5, 1.7),
              FlSpot(1, 1.4),
              FlSpot(2, 2.2),
              FlSpot(3, 1.2),
              FlSpot(4, 3),
              FlSpot(5, 1.7),
              FlSpot(6, 2),
            ],
            isCurved: true,
            dotData: const FlDotData(show: false),
            color: Theme.of(context).colorScheme.onBackground,
            belowBarData: BarAreaData(
              show: true,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          )
        ],
      ));

  Widget _buildMyIconButton({required IconData icon, Function()? onTap}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1.w,
          color: Theme.of(context).colorScheme.onBackground.withOpacity(.5),
        ),
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  Widget _buildProfileStatus(
      {final bool isLast = false, String? mainText, String? subText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              mainText ?? '',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              subText ?? '',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        SizedBox(width: 24.w),
        !isLast
            ? VerticalDivider(
                width: 2.w,
                color: Theme.of(context).colorScheme.onBackground,
                indent: 5,
                endIndent: 5,
              )
            : const SizedBox.shrink(),
        !isLast ? SizedBox(width: 24.w) : const SizedBox.shrink(),
      ],
    );
  }
}

List<dataClass> myList = [
  dataClass('June', 20),
  dataClass('March', 10),
  dataClass('April', 50),
  dataClass('November', 80),
  dataClass('December', 30),
];

class dataClass {
  String month;
  int data;

  dataClass(this.month, this.data);
}
