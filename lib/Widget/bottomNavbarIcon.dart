import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class bottomNavbarIcon extends StatelessWidget {
  final int position;
  final int indexPosition;
  final String svg;
  const bottomNavbarIcon(
      {required this.position,
      required this.indexPosition,
      required this.svg,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        'assets/images/bottomNavBar/$svg${indexPosition != position ? 'outlined' : ''}.svg',
        color: indexPosition != position
            ? Theme.of(context).colorScheme.onSurface
            : Theme.of(context).colorScheme.primary);
  }
}
