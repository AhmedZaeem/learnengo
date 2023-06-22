import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class appThemes {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: const Color(0xff26272C),
      ),
      bodyMedium: TextStyle(color: const Color(0xff26272C), fontSize: 16.sp),
      bodySmall: TextStyle(
          color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.w400),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3A6AE2),
      onPrimary: Color(0xffF6F8FE),
      secondary: Color(0xffEDF2FC),
      onSecondary: Color(0xffEDF2FC),
      error: Colors.red,
      onError: Colors.red,
      background: Colors.white,
      onBackground: Colors.white,
      surface: Color(0xff858A97),
      onSurface: Colors.white,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xff0F0F10),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xff3A6AE2),
      onPrimary: Color(0xff0A1C47),
      secondary: Color(0xff112D74),
      onSecondary: Color(0xff112D74),
      error: Colors.red,
      onError: Colors.red,
      background: Color(0xff0F0F10),
      onBackground: Color(0xff0F0F10),
      surface: Color(0xffA1A5AF),
      onSurface: Color(0xff0F0F10),
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 16.sp),
      bodySmall: TextStyle(
          color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w400),
    ),
  );
}
