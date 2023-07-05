import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class buildBottomSheetChoice extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onTap;
  const buildBottomSheetChoice(
      {super.key, required this.onTap, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                width: 1.w,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              borderRadius: BorderRadius.circular(16.r)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 32.h),
              Icon(
                icon,
                size: 32,
              ),
              SizedBox(height: 16.h),
              Text(text),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
