import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomSelectorBTN extends StatefulWidget {
  final String? trailing;
  final String? svgIconName;
  final String btnText;
  final Color? trailingColor;
  final Function()? customMethod;
  bool isSelected;
  final bool canBeUnSelected;
  CustomSelectorBTN(
      {required this.btnText,
      this.trailingColor,
      this.customMethod,
      this.svgIconName,
      this.canBeUnSelected = true,
      this.isSelected = false,
      this.trailing,
      super.key});

  @override
  State<CustomSelectorBTN> createState() => _CustomSelectorBTNState();
}

class _CustomSelectorBTNState extends State<CustomSelectorBTN> {
  var btnText;
  @override
  Widget build(BuildContext context) {
    btnText = widget.btnText;
    return InkWell(
      onTap: widget.customMethod ??
          () {
            if (widget.canBeUnSelected) {
              setState(() {
                widget.isSelected = !widget.isSelected;
              });
            }
          },
      child: Container(
        height: 56.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: widget.isSelected
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.background,
            border: Border.all(
                width: 2.w,
                color: widget.isSelected
                    ? Theme.of(context).colorScheme.primary
                    : const Color(0xff6C717F))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 20.w),
            SvgPicture.asset('assets/images/svgs/${widget.svgIconName}.svg'),
            SizedBox(width: 12.w),
            Text(
              widget.btnText,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            Text(
              widget.trailing ?? '',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: widget.trailingColor ??
                      Theme.of(context).colorScheme.primary),
            ),
            SizedBox(width: 24.w)
          ],
        ),
      ),
    );
  }
}
