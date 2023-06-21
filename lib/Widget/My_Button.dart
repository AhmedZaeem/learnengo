import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class My_Button extends StatefulWidget {
  final Function()? onTap;
  final Color? buttonColor;
  final Color textColor;
  final String buttonText;
  const My_Button(
      {required this.buttonText,
      this.textColor = Colors.white,
      this.buttonColor,
      this.onTap,
      super.key});

  @override
  State<My_Button> createState() => _My_ButtonState();
}

class _My_ButtonState extends State<My_Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: widget.buttonColor ?? Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Text(
          widget.buttonText,
          style: TextStyle(
              fontSize: 20.sp,
              color: widget.textColor,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
