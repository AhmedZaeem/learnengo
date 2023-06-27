import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnengo/modules/levelModule.dart';

class levelWidget extends StatefulWidget {
  final int index;
  final Function()? onTap;
  final levelModule level;
  const levelWidget(this.index, {this.onTap, required this.level, super.key});

  @override
  State<levelWidget> createState() => _levelWidgetState();
}

class _levelWidgetState extends State<levelWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: widget.index % 2 == 0
              ? MainAxisAlignment.start
              : MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            widget.index % 2 != 0
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(widget.level.levelTitle),
                      Text(widget.level.subLevelsCount),
                    ],
                  )
                : const SizedBox.shrink(),
            widget.index % 2 != 0
                ? SizedBox(width: 16.w)
                : const SizedBox.shrink(),
            InkWell(
              onTap: widget.level.enabled ? widget.onTap : null,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 6.w,
                    color: widget.level.enabled
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onInverseSurface,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                  child: CircleAvatar(
                    radius: 40.r,
                    backgroundColor: widget.level.enabled
                        ? Theme.of(context).colorScheme.onSecondaryContainer
                        : Theme.of(context).colorScheme.onSurface,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0.w,
                        horizontal: 16.h,
                      ),
                      child: SvgPicture.asset(
                          'assets/images/levels/${widget.level.icon}.svg'),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 16.w),
            widget.index % 2 == 0
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(widget.level.levelTitle),
                      Text(widget.level.subLevelsCount),
                    ],
                  )
                : const SizedBox.shrink(),
          ],
        )
      ],
    );
  }
}
