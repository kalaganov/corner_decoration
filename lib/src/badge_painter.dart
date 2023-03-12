import 'package:flutter/painting.dart';

import 'badge_position.dart';
import 'badge_position_extensions.dart';
import 'badge_shadow.dart';

class BadgePainter extends BoxPainter {
  final Size badgeSize;
  final Radius badgeCornerRadius;
  final BadgePosition badgePosition;
  final Color? color;
  final Gradient? gradient;
  final TextSpan? textSpan;
  final double textSpanBaselineShift;
  final Offset textSpanOffset;
  final BadgeShadow? shadow;
  final TextDirection textDirection;
  final bool isEmoji;

  const BadgePainter({
    required this.badgeSize,
    required this.badgeCornerRadius,
    required this.badgePosition,
    required this.textSpanBaselineShift,
    required this.textSpanOffset,
    required this.textDirection,
    this.color,
    this.gradient,
    this.textSpan,
    this.shadow,
    required this.isEmoji,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final size = cfg.size ?? const Size(0, 0);
    final clipRRect = RRect.fromLTRBR(
      offset.dx,
      offset.dy,
      offset.dx + size.width,
      offset.dy + size.height,
      badgeCornerRadius,
    );
    canvas.save();
    canvas.clipRRect(clipRRect);

    final shift = badgePosition.toPathOffset(
      globalOffset: offset,
      globalSize: size,
      badgeSize: badgeSize,
    );
    canvas.translate(shift.dx, shift.dy);

    final path = badgePosition.toBadgePath(badgeSize);
    if (shadow != null) {
      canvas.drawShadow(path, shadow!.color, shadow!.elevation, false);
    }
    canvas.drawPath(path, _createBadgePaint());

    // shift and rotate canvas, draw text
    if (textSpan != null) {
      final textPainter = _createTextPainter();
      final textTranslate = badgePosition.toTextShift(
        textPainter,
        textSpanBaselineShift,
      );
      if (!isEmoji) {
        canvas.translate(textTranslate.dx, textTranslate.dy);
      }
      if (!isEmoji) {
        final angle = badgePosition.toAngle(badgeSize);
        canvas.rotate(angle);
      }

      textPainter.paint(canvas, textSpanOffset);
    }
    canvas.restore();
  }

  Paint _createBadgePaint() {
    final Paint paint = Paint();
    if (color != null) {
      paint.color = color!;
    } else {
      paint.shader = gradient!.createShader(
        Rect.fromLTWH(0, 0, badgeSize.width, badgeSize.height),
        textDirection: textDirection,
      );
    }
    return paint..isAntiAlias = true;
  }

  TextPainter _createTextPainter() {
    final hypo = calculateHypotenuse(badgeSize.width, badgeSize.height);
    return TextPainter(
      text: textSpan,
      textDirection: textDirection,
      textAlign: TextAlign.center,
    )..layout(minWidth: hypo, maxWidth: hypo);
  }
}
