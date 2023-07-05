import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class notificationSettings extends StatefulWidget {
  const notificationSettings({super.key});

  @override
  State<notificationSettings> createState() => _notificationSettingsState();
}

class _notificationSettingsState extends State<notificationSettings> {
  List switches = [true, true, true, true, true];
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocale = AppLocalizations.of(context)!;
    List notificationText = [
      appLocale.exerciseReminder,
      appLocale.weeklyProgress,
      appLocale.newFollowers,
      appLocale.appUpdates,
      appLocale.newPromotion,
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
                  appLocale.notification,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        notificationText[index],
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      CupertinoSwitch(
                        thumbColor: Theme.of(context).scaffoldBackgroundColor,
                        activeColor: Theme.of(context).colorScheme.primary,
                        trackColor: Colors.grey.shade600,
                        value: switches[index],
                        onChanged: (value) =>
                            setState(() => switches[index] = value),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20.h);
                },
                itemCount: notificationText.length),
          ],
        ),
      ),
    );
  }
}
