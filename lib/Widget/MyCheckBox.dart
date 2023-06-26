import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MyCheckBox extends StatelessWidget {
  final bool checked;
  const MyCheckBox({required this.checked, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20.w,
      height: 20.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.onSurface,
          width: checked ? 0.w : 1.w,
        ),
      ),
      child: checked
          ? SvgPicture.asset('assets/images/svgs/checkboximage.svg')
          : const SizedBox.shrink(),
    );
  }
}
