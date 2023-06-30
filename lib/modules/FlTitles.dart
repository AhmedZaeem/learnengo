import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlTitles {
  static getFlTitles() => FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            reservedSize: 50.w,
            getTitlesWidget: (value, meta) {
              String txt = '';
              switch (value.toInt()) {
                case 0:
                  txt = '0';
                case 1:
                  txt = '200';
                case 2:
                  txt = '400';
                case 3:
                  txt = '600';
                case 4:
                  txt = '800';
                case 5:
                  txt = '1000';
              }
              return Text(txt);
            },
            showTitles: true,
          ),
        ),
        rightTitles: const AxisTitles(),
        topTitles: const AxisTitles(),
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(
          reservedSize: 46.h,
          getTitlesWidget: (value, meta) {
            String txt = '';
            switch (value.toInt()) {
              case 0:
                txt = 'Mo';
              case 1:
                txt = 'Tu';
              case 2:
                txt = 'We';
              case 3:
                txt = 'Th';
              case 4:
                txt = 'Fr';
              case 5:
                txt = 'Sa';
              case 6:
                txt = 'Su';
            }
            return Column(
              children: [
                SizedBox(height: 12.h),
                Text(
                  txt,
                  style: TextStyle(
                    fontSize: 14.sp,
                  ),
                ),
              ],
            );
          },
          showTitles: true,
        )),
      );
}
