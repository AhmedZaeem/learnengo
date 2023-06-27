import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class gridViewItem extends StatefulWidget {
  final int selectedIndex;
  final int itemIndex;
  final String flag;
  final String language;
  final Function()? onTap;
  final Color? borderColor;
  final String? iconSize;
  const gridViewItem(
      {required this.flag,
      this.borderColor,
      this.iconSize,
      this.onTap,
      required this.language,
      required this.selectedIndex,
      required this.itemIndex,
      super.key});

  @override
  State<gridViewItem> createState() => _gridViewItemState();
}

class _gridViewItemState extends State<gridViewItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              border: widget.borderColor != null
                  ? Border.all(
                      width: 2,
                      color: widget.borderColor!,
                    )
                  : Border.all(
                      width: 2,
                      color: widget.selectedIndex == widget.itemIndex
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                    ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
              child: SizedBox(
                width: 70.w,
                height: 50.h,
                child: SvgPicture.asset(
                  'assets/images/svgs/${widget.flag}.svg',
                  fit: widget.iconSize != null ? BoxFit.none : BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Text(widget.language),
      ],
    );
  }
}
