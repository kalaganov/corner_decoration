library rotated_corner_decoration;

import 'dart:math' as math;

import 'package:flutter/material.dart';

class RotatedCornerDecoration extends Decoration {
  final BadgeGeometry _geometry;
  final Color? _color;
  final Gradient? _gradient;
  final TextSpan? _textSpan;
  final LabelInsets _insets;
  final BadgeShadow? _shadow;

  const RotatedCornerDecoration({
    required BadgeGeometry geometry,
    Color? color,
    Gradient? gradient,
    TextSpan? textSpan,
    LabelInsets labelInsets = const LabelInsets(),
    BadgeShadow? badgeShadow,
  })  : assert((color != null && gradient == null) || (color == null && gradient != null)),
        _geometry = geometry,
        _color = color,
        _gradient = gradient,
        _textSpan = textSpan,
        _insets = labelInsets,
        _shadow = badgeShadow;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _BadgePainter(_geometry, _color, _gradient, _textSpan, _insets, _shadow);
  }
}

class _BadgePainter extends BoxPainter {
  final BadgeGeometry _geometry;
  final Color? _color;
  final Gradient? _gradient;
  final TextSpan? _textSpan;
  final LabelInsets _insets;
  final BadgeShadow? _shadow;

  const _BadgePainter(this._geometry, this._color, this._gradient, this._textSpan, this._insets, this._shadow);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final size = cfg.size ?? const Size(0, 0);
    canvas.save();
    canvas.clipRRect(_geometry._createRRect(offset, size.width, size.height));
    final Offset pathOffset = _geometry._calcPathOffset(offset, size.width, size.height);
    canvas.translate(pathOffset.dx, pathOffset.dy);
    final Path path = _geometry._createPath();
    if (_shadow != null) {
      canvas.drawShadow(path, _shadow!.color, _shadow!.elevation, false);
    }
    canvas.drawPath(path, _badgePaint);

    // shift and rotate canvas, draw text
    if (_textSpan != null) {
      final textPainter = _createTextPainter();
      final textTranslate = _geometry._calcTextTranslate(textPainter, _insets);
      canvas.translate(textTranslate.dx, textTranslate.dy);
      canvas.rotate(_geometry._calcAngle());
      textPainter.paint(canvas, _insets._createTextOffset());
    }
    canvas.restore();
  }

  Paint get _badgePaint {
    final Paint paint = Paint();
    if (_color != null) {
      paint.color = _color!;
    } else {
      paint.shader = _gradient!.createShader(Rect.fromLTWH(0, 0, _geometry.width, _geometry.height));
    }
    return paint..isAntiAlias = true;
  }

  TextPainter _createTextPainter() {
    final hypo = _calcHypo(_geometry.width, _geometry.height);
    return TextPainter(
      text: _textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    )..layout(minWidth: hypo, maxWidth: hypo);
  }
}

class BadgeShadow {
  final Color color;
  final double elevation;

  const BadgeShadow({required this.color, required this.elevation}) : assert(elevation > 0);
}

class BadgeGeometry {
  final double width;
  final double height;
  final double cornerRadius;
  final BadgeAlignment alignment;

  const BadgeGeometry({
    required this.width,
    required this.height,
    this.cornerRadius = 4,
    this.alignment = BadgeAlignment.topRight,
  })  : assert(width > 0),
        assert(height > 0),
        assert(cornerRadius >= 0);

  RRect _createRRect(Offset offset, double w, double h) {
    final radius = Radius.circular(cornerRadius);
    return RRect.fromLTRBR(offset.dx, offset.dy, offset.dx + w, offset.dy + h, radius);
  }

  Offset _calcPathOffset(Offset offset, double w, double h) {
    switch (alignment) {
      case BadgeAlignment.bottomLeft:
        return Offset(offset.dx, offset.dy + h - this.height);
      case BadgeAlignment.bottomRight:
        return Offset(offset.dx + w - this.width, offset.dy + h);
      case BadgeAlignment.topLeft:
        return Offset(offset.dx, offset.dy + height);
      default:
        return Offset(offset.dx + w - this.width, offset.dy);
    }
  }

  Offset _calcTextTranslate(TextPainter painter, LabelInsets insets) {
    switch (alignment) {
      case BadgeAlignment.bottomLeft:
        final v = math.sqrt((insets.baselineShift * insets.baselineShift) / 2);
        final textShift = -1 * _calcHypo(v, v);
        return Offset(textShift, -textShift);
      case BadgeAlignment.bottomRight:
        final v = math.sqrt((insets.baselineShift * insets.baselineShift) / 2);
        final textShift = _calcHypo(v, v);
        return Offset(textShift, textShift);
      case BadgeAlignment.topLeft:
        final v = painter.height / 2 + math.sqrt((insets.baselineShift * insets.baselineShift) / 2);
        final textShift = _calcHypo(v, v);
        return Offset(-textShift, -textShift);
      default:
        final v = painter.height / 2 + math.sqrt((insets.baselineShift * insets.baselineShift) / 2);
        final textShift = _calcHypo(v, v);
        return Offset(textShift, -textShift);
    }
  }

  Path _createPath() {
    switch (alignment) {
      case BadgeAlignment.bottomLeft:
        return Path()
          ..lineTo(0, height)
          ..lineTo(width, height)
          ..close();
      case BadgeAlignment.bottomRight:
        return Path()
          ..lineTo(width, 0)
          ..lineTo(width, -height)
          ..close();
      case BadgeAlignment.topLeft:
        return Path()
          ..lineTo(width, -height)
          ..lineTo(0, -height)
          ..close();
      default:
        return Path()
          ..lineTo(width, 0)
          ..lineTo(width, height)
          ..close();
    }
  }

  double _calcAngle() {
    switch (alignment) {
      case BadgeAlignment.bottomLeft:
        return math.atan2(height, width);
      case BadgeAlignment.bottomRight:
        return -math.atan2(height, width);
      case BadgeAlignment.topLeft:
        return -math.atan2(height, width);
      default:
        return math.atan2(height, width);
    }
  }
}

class LabelInsets {
  final double baselineShift;
  final double? start;
  final double? end;

  const LabelInsets({
    this.baselineShift = 1,
    this.start,
    this.end,
  })  : assert(baselineShift >= 0),
        assert((start == null && end == null) || (start != null && start > 0 && end == null) || (end != null && end > 0 && start == null));

  Offset _createTextOffset() => Offset(start == null && end == null ? 0 : (start != null ? start! : -end!), 0);
}

double _calcHypo(double w, double h) => math.sqrt(w * w + h * h);

enum BadgeAlignment { topLeft, topRight, bottomLeft, bottomRight }
