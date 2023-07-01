import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class endDrawerItem extends StatefulWidget {
  final Color? iconColor;
  final Color? buttonColor;
  final String? buttonText;
  final Widget? trailing;
  final IconData icon;
  final Function()? onTap;
  const endDrawerItem({
    required this.icon,
    super.key,
    this.onTap,
    this.trailing,
    this.buttonColor,
    this.iconColor,
    this.buttonText,
  });

  @override
  State<endDrawerItem> createState() => _endDrawerItemState();
}

class _endDrawerItemState extends State<endDrawerItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: widget.buttonColor,
            radius: 28,
            child: Icon(
              widget.icon,
              color: widget.iconColor,
              size: 32,
            ),
          ),
          SizedBox(width: 20.w),
          Text(
            widget.buttonText ?? '',
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(fontSize: 16.sp),
          ),
          const Spacer(),
          widget.trailing ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
