import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomCpv extends StatelessWidget {
  final void Function()? onPressed;
  final String iconpath;
  final double width;
  final double height;
  final Color color;

  const BottomCpv({
    super.key,
    required this.iconpath,
    this.onPressed,
    required this.width,
    required this.height,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        iconpath,
        width: width,
        height: height,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
      ),
    );
  }
}
