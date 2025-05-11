import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AdaptiveDouble on double {
  double get r => SizeExtension(this).r;
}

extension AdaptiveInt on int {
  double get r => SizeExtension(this).r;
}

extension AdaptiveTextStyle on TextStyle {
  TextStyle get sp => copyWith(fontSize: fontSize?.sp);
}

extension AdaptiveBorderRadius on BorderRadius {
  BorderRadius get r => BorderRadiusExtension(this).r;
}

extension AdaptiveEdgeInsets on EdgeInsets {
  EdgeInsets get r => EdgeInsetsExtension(this).r;
}

extension AdaptiveSizedBox on SizedBox {
  SizedBox get r => SizedBox(
    width: AdaptiveDouble(width)?.r,
    height: AdaptiveDouble(height)?.r,
    child: child,
  );
}
