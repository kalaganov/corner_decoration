library rotated_corner_decoration;

import 'package:flutter/material.dart';

import 'badge_painter.dart';
import 'badge_position.dart';
import 'badge_position_extensions.dart';
import 'badge_shadow.dart';

class RotatedCornerDecoration extends Decoration {
  final Color? color;
  final Size badgeSize;
  final Radius badgeCornerRadius;
  final BadgePosition badgePosition;
  final Gradient? gradient;
  final TextSpan? textSpan;
  final double spanBaselineShift;
  final double spanHorizontalOffset;
  final BadgeShadow? badgeShadow;
  final TextDirection textDirection;
  final bool isEmoji;

  const RotatedCornerDecoration.withColor({
    required Color color,
    required this.badgeSize,
    this.badgeCornerRadius = Radius.zero,
    this.badgePosition = BadgePosition.topEnd,
    this.textSpan,
    this.spanBaselineShift = 1.0,
    this.spanHorizontalOffset = 0.0,
    this.badgeShadow,
    this.textDirection = TextDirection.ltr,
    this.isEmoji = false,
  })  : this.color = color,
        gradient = null;

  const RotatedCornerDecoration.withGradient({
    required Gradient gradient,
    required this.badgeSize,
    this.badgeCornerRadius = Radius.zero,
    this.badgePosition = BadgePosition.topEnd,
    this.textSpan,
    this.spanBaselineShift = 1.0,
    this.spanHorizontalOffset = 0.0,
    this.badgeShadow,
    this.textDirection = TextDirection.ltr,
    this.isEmoji = false,
  })  : this.gradient = gradient,
        color = null;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return BadgePainter(
      badgeSize: badgeSize,
      badgeCornerRadius: badgeCornerRadius,
      badgePosition: badgePosition.fromTextDirection(textDirection),
      textSpanBaselineShift: spanBaselineShift,
      textSpanOffset: Offset(spanHorizontalOffset, 0),
      textDirection: textDirection,
      color: color,
      gradient: gradient,
      textSpan: textSpan,
      shadow: badgeShadow,
      isEmoji: isEmoji,
    );
  }
}
