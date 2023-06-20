import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Screens/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primaryColor: const Color(0xff3A6AE2)),
            title: 'LearnEngo',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: const [Locale('en'), Locale('ar')],
            locale: const Locale('en'),
            home: const splashScreen());
      },
    );
  }
}
