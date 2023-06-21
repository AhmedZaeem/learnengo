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
            theme: ThemeData(
              textTheme: TextTheme(
                bodyMedium:
                    TextStyle(color: const Color(0xff26272C), fontSize: 16.sp),
              ),
              colorScheme: const ColorScheme(
                brightness: Brightness.light,
                primary: Color(0xff3A6AE2),
                onPrimary: Color(0xff3A6AE2),
                secondary: Color(0xffEDF2FC),
                onSecondary: Color(0xffEDF2FC),
                error: Colors.red,
                onError: Colors.red,
                background: Colors.white,
                onBackground: Colors.white,
                surface: Colors.white,
                onSurface: Colors.white,
              ),
            ),
            darkTheme: ThemeData(
              colorScheme: const ColorScheme(
                brightness: Brightness.dark,
                primary: Color(0xff3A6AE2),
                onPrimary: Color(0xff3A6AE2),
                secondary: Color(0xff112D74),
                onSecondary: Color(0xff112D74),
                error: Colors.red,
                onError: Colors.red,
                background: Color(0xff0F0F10),
                onBackground: Color(0xff0F0F10),
                surface: Color(0xff0F0F10),
                onSurface: Color(0xff0F0F10),
              ),
              textTheme: TextTheme(
                bodyMedium: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ),
            themeMode: ThemeMode.system,
            title: 'LearnEngo',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: const [Locale('en')],
            locale: const Locale('en'),
            home: const splashScreen());
      },
    );
  }
}
