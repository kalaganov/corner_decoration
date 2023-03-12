import 'dart:ui' show Color;

class BadgeShadow {
  final Color color;
  final double elevation;

  const BadgeShadow({
    required this.color,
    required this.elevation,
  }) : assert(elevation >= 0);

  @override
  String toString() {
    return 'BadgeShadow{color: $color, elevation: $elevation}';
  }
}
