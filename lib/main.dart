import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'CachedController.dart';
import 'Screens/splashScreen.dart';
import 'ThemeProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachedController().initCache();

  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider()..initialize(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (BuildContext context, Widget? child) {
          return Consumer<ThemeProvider>(builder: (context, provider, child) {
            child:
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: 'Nunito',
                scaffoldBackgroundColor: Colors.white,
                textTheme: TextTheme(
                  headlineSmall: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff26272C),
                  ),
                  headlineMedium: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  displaySmall: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xffBDC0C7),
                  ),
                  bodyMedium: TextStyle(
                      color: const Color(0xff26272C), fontSize: 16.sp),
                  labelSmall: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                  bodySmall: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                ),
                colorScheme: const ColorScheme(
                  brightness: Brightness.light,
                  primary: Color(0xff3A6AE2),
                  onPrimary: Color(0xffF6F8FE),
                  secondary: Color(0xff04A4FE),
                  onSecondary: Color(0xffF5F5F5),
                  error: Colors.red,
                  onError: Colors.red,
                  onSecondaryContainer: Color(0xffEDF2FC),
                  background: Colors.white,
                  onBackground: Color(0xff8C8D90),
                  surface: Color(0xff858A97),
                  onInverseSurface: Color(0xffF6F8FE),
                  onTertiary: Color(0xffEDF2FC),
                  onSurface: Color(0xffBDC0C7),
                  outline: Color(0xffC1C1C3),
                  secondaryContainer: Color(0xffD0E7FF),
                  inversePrimary: Color(0xff26272C),
                  inverseSurface: Color(0xffF4F4F6),
                ),
              ),
              darkTheme: ThemeData(
                fontFamily: 'Nunito',
                scaffoldBackgroundColor: const Color(0xff0F0F10),
                colorScheme: const ColorScheme(
                  brightness: Brightness.dark,
                  primary: Color(0xff3A6AE2),
                  onPrimary: Color(0xff0A1C47),
                  outline: Color(0xff737478),
                  secondary: Color(0xff04A4FE),
                  onInverseSurface: Color(0xff0A1C47),
                  onSecondary: Color(0xff414244),
                  onTertiary: Color(0xff112D74),
                  error: Colors.red,
                  onError: Colors.red,
                  background: Color(0xff0F0F10),
                  onBackground: Color(0xffA7A8AA),
                  onSecondaryContainer: Color(0xff112D74),
                  surface: Color(0xffA1A5AF),
                  onSurface: Color(0xff6C717F),
                  inverseSurface: Color(0xff3D4048),
                  inversePrimary: Color(0xffFCFCFD),
                ),
                textTheme: TextTheme(
                  headlineMedium: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  headlineSmall: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  bodyMedium: TextStyle(color: Colors.white, fontSize: 16.sp),
                  labelSmall: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                  bodySmall: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400),
                  displaySmall: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(0xff6C717F),
                  ),
                ),
              ),
              themeMode: provider.themeMode,
              title: 'LearnEngo',
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: const [Locale('en')],
              locale: const Locale('en'),
              home: const splashScreen(),
            );
          });
        });
  }
}
