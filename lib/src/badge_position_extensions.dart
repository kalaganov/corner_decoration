import 'dart:math' as math;

import 'package:flutter/painting.dart'
    show Offset, Size, Path, TextPainter, TextDirection;

import 'badge_position.dart';

extension BadgePositionExt on BadgePosition {
  Offset toPathOffset({
    required Offset globalOffset,
    required Size globalSize,
    required Size badgeSize,
  }) {
    switch (this) {
      case BadgePosition.bottomStart:
        return Offset(
          globalOffset.dx,
          globalOffset.dy + globalSize.height - badgeSize.height,
        );
      case BadgePosition.bottomEnd:
        return Offset(
          globalOffset.dx + globalSize.width - badgeSize.width,
          globalOffset.dy + globalSize.height,
        );
      case BadgePosition.topStart:
        return Offset(
          globalOffset.dx,
          globalOffset.dy + badgeSize.height,
        );
      default:
        return Offset(
          globalOffset.dx + globalSize.width - badgeSize.width,
          globalOffset.dy,
        );
    }
  }

  Path toBadgePath(Size badgeSize) {
    switch (this) {
      case BadgePosition.bottomStart:
        return Path()
          ..lineTo(0, badgeSize.height)
          ..lineTo(badgeSize.width, badgeSize.height)
          ..close();
      case BadgePosition.bottomEnd:
        return Path()
          ..lineTo(badgeSize.width, 0)
          ..lineTo(badgeSize.width, -badgeSize.height)
          ..close();
      case BadgePosition.topStart:
        return Path()
          ..lineTo(badgeSize.width, -badgeSize.height)
          ..lineTo(0, -badgeSize.height)
          ..close();
      default:
        return Path()
          ..lineTo(badgeSize.width, 0)
          ..lineTo(badgeSize.width, badgeSize.height)
          ..close();
    }
  }

  Offset toTextShift(
    TextPainter painter,
    double baselineShift,
  ) {
    switch (this) {
      case BadgePosition.bottomStart:
        final v = math.sqrt((baselineShift * baselineShift) / 2);
        final textShift = -1 * calculateHypotenuse(v, v);
        return Offset(textShift, -textShift);
      case BadgePosition.bottomEnd:
        final v = math.sqrt((baselineShift * baselineShift) / 2);
        final textShift = calculateHypotenuse(v, v);
        return Offset(textShift, textShift);
      case BadgePosition.topStart:
        final v =
            painter.height / 2 + math.sqrt((baselineShift * baselineShift) / 2);
        final textShift = calculateHypotenuse(v, v);
        return Offset(-textShift, -textShift);
      default:
        final v =
            painter.height / 2 + math.sqrt((baselineShift * baselineShift) / 2);
        final textShift = calculateHypotenuse(v, v);
        return Offset(textShift, -textShift);
    }
  }

  double toAngle(Size badgeSize) {
    switch (this) {
      case BadgePosition.bottomStart:
        return math.atan2(badgeSize.height, badgeSize.width);
      case BadgePosition.bottomEnd:
        return -math.atan2(badgeSize.height, badgeSize.width);
      case BadgePosition.topStart:
        return -math.atan2(badgeSize.height, badgeSize.width);
      default:
        return math.atan2(badgeSize.height, badgeSize.width);
    }
  }

  BadgePosition fromTextDirection(TextDirection td) {
    final isRtl = td == TextDirection.rtl;
    switch (this) {
      case BadgePosition.topStart:
        return isRtl ? BadgePosition.topEnd : BadgePosition.topStart;
      case BadgePosition.topEnd:
        return isRtl ? BadgePosition.topStart : BadgePosition.topEnd;
      case BadgePosition.bottomStart:
        return isRtl ? BadgePosition.bottomEnd : BadgePosition.bottomStart;
      case BadgePosition.bottomEnd:
        return isRtl ? BadgePosition.bottomStart : BadgePosition.bottomEnd;
    }
  }
}

double calculateHypotenuse(double w, double h) => math.sqrt(w * w + h * h);
