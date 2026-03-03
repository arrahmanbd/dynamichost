import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvgIcon extends StatelessWidget {
  final String asset;
  final double? size;
  final Color? color;
  final BoxFit fit;

  const AppSvgIcon(
    this.asset, {
    super.key,
    this.size,
    this.color,
    this.fit = BoxFit.contain,
  });



  @override
  Widget build(BuildContext context) {
    final iconSize = size ?? 24.w;

    return SvgPicture.asset(
      asset,
      width: iconSize,
      height: iconSize,
      fit: fit,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
    );
  }
}

