import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class nextLevel extends StatefulWidget {
  final String? btnText;
  final Function()? onTap;
  final bool enabled;
  const nextLevel({this.onTap, this.enabled = true, this.btnText, super.key});

  @override
  State<nextLevel> createState() => _nextLevelState();
}

class _nextLevelState extends State<nextLevel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: InkWell(
        onTap: widget.enabled ? widget.onTap : null,
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: const Color(0xff858A97),
            gradient: widget.enabled
                ? LinearGradient(
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.secondary,
                    ],
                    begin: AlignmentDirectional.bottomStart,
                    end: AlignmentDirectional.topEnd,
                  )
                : null,
            backgroundBlendMode: widget.enabled ? null : BlendMode.difference,
            image: const DecorationImage(
              opacity: .3,
              image: AssetImage('assets/images/btnMask.png'),
              fit: BoxFit.contain,
            ),
          ),
          height: 98.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                  'assets/images/svgs/${widget.enabled ? 'medal1' : 'disabledMedal'}.svg'),
              SizedBox(width: 24.w),
              Text(
                widget.btnText ?? 'SKIP AHEAD',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
