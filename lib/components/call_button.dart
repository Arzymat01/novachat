import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CallButton extends StatelessWidget {
  final String svgPath;
  final Color color;
  final VoidCallback onTap;

  const CallButton({
    super.key,
    required this.svgPath,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(56),
      onTap: onTap,
      child: CircleAvatar(
        radius: 28,
        backgroundColor: color,
        child: SvgPicture.asset(
          svgPath,
          width: 26,
          height: 26,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
    );
  }
}
