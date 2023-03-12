import 'package:example/demo_item.dart';
import 'package:flutter/material.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

class DemoGrid extends StatelessWidget {
  const DemoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        cardTheme: CardTheme.of(context).copyWith(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
      child: GridView.count(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 48),
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        crossAxisCount: 2,
        children: <Widget>[
          const DemoItem(
            text: 'Small simple badge',
            foregroundDecoration: RotatedCornerDecoration.withColor(
              color: Color(0xffffd700),
              badgeSize: Size(16, 16),
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              cardTheme: CardTheme.of(context).copyWith(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            child: const DemoItem(
              text: 'Apply corner radius, badge position, color and text style',
              foregroundDecoration: RotatedCornerDecoration.withColor(
                color: Colors.red,
                spanBaselineShift: 4,
                badgeSize: Size(64, 64),
                badgeCornerRadius: Radius.circular(8),
                badgePosition: BadgePosition.topStart,
                textSpan: TextSpan(
                  text: 'OMG',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      BoxShadow(color: Colors.yellowAccent, blurRadius: 8),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const DemoItem(
            text: 'Multiline badge',
            foregroundDecoration: RotatedCornerDecoration.withColor(
              color: Colors.blue,
              badgeSize: Size(64, 64),
              textSpan: TextSpan(
                text: 'Multiline\nbadge',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
          const DemoItem(
            text: 'TextSpan example',
            foregroundDecoration: RotatedCornerDecoration.withColor(
              color: Colors.black87,
              badgeSize: Size(64, 64),
              spanBaselineShift: 2,
              textSpan: TextSpan(
                children: [
                  TextSpan(
                    text: 'LOREM\n',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  TextSpan(
                    text: 'IPSUM',
                    style: TextStyle(
                      fontSize: 7,
                      fontStyle: FontStyle.italic,
                      letterSpacing: 5,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const DemoItem(
            text: 'badgeSize: Size(128, 48)',
            foregroundDecoration: RotatedCornerDecoration.withColor(
              color: Colors.brown,
              badgeSize: Size(112, 56),
              textSpan: TextSpan(
                text: 'WEIRD BADGE',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
          const DemoItem(
            text: 'spanHorizontalOffset: -12',
            foregroundDecoration: RotatedCornerDecoration.withColor(
              color: Colors.blueGrey,
              badgeSize: Size(64, 64),
              textSpan: TextSpan(
                text: 'WOW',
                style: TextStyle(fontSize: 10),
              ),
              spanHorizontalOffset: -12,
            ),
          ),
          const DemoItem(
            text: 'By default\n'
                'baselineShift: 1.0',
            foregroundDecoration: RotatedCornerDecoration.withColor(
              color: Colors.green,
              badgeSize: Size(64, 64),
              textSpan: TextSpan(
                text: 'SHIFT 1',
                style: TextStyle(fontSize: 10, backgroundColor: Colors.black),
              ),
            ),
          ),
          const DemoItem(
            text: 'baselineShift: 4.0',
            foregroundDecoration: RotatedCornerDecoration.withColor(
              color: Colors.green,
              badgeSize: Size(64, 64),
              spanBaselineShift: 3,
              textSpan: TextSpan(
                text: 'SHIFT 4',
                style: TextStyle(fontSize: 10, backgroundColor: Colors.black),
              ),
            ),
          ),
          const DemoItem(
            text: 'Apply any gradients instead of colors.\n'
                'e.g. LinearGradients',
            foregroundDecoration: RotatedCornerDecoration.withGradient(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.lightGreenAccent],
              ),
              badgeSize: Size(64, 64),
            ),
            decoration: RotatedCornerDecoration.withGradient(
              badgePosition: BadgePosition.topStart,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                stops: [0, 0.5, 1],
                colors: [
                  Colors.purpleAccent,
                  Colors.amber,
                  Colors.blue,
                ],
              ),
              badgeSize: Size(64, 64),
            ),
          ),
          DemoItem(
            text: 'or RadialGradient, SweepGradient',
            foregroundDecoration: RotatedCornerDecoration.withGradient(
              gradient: RadialGradient(
                center: Alignment.topRight,
                radius: 1.5,
                stops: const [0, 0.25, 0.5],
                colors: [
                  Colors.redAccent,
                  Colors.redAccent.withOpacity(0.5),
                  Colors.redAccent.withOpacity(0),
                ],
              ),
              badgeSize: const Size(64, 64),
            ),
            decoration: RotatedCornerDecoration.withGradient(
              badgePosition: BadgePosition.topStart,
              gradient: SweepGradient(
                center: const FractionalOffset(0.27, -0.65),
                colors: List.generate(360, _generator),
              ),
              badgeSize: const Size(64, 64),
            ),
          ),
          const DemoItem(
            text: 'Add shadow with color and elevation',
            foregroundDecoration: RotatedCornerDecoration.withColor(
              color: Colors.lightBlue,
              badgeSize: Size(64, 64),
              badgeShadow: BadgeShadow(color: Colors.black, elevation: 4),
            ),
          ),
          const Directionality(
            textDirection: TextDirection.ltr,
            child: DemoItem(
              text: 'textDirection: TextDirection.ltr\n\n'
                  'badgePosition: bottomStart',
              foregroundDecoration: RotatedCornerDecoration.withColor(
                color: Colors.indigo,
                badgeSize: Size(64, 64),
                badgePosition: BadgePosition.bottomStart,
                textDirection: TextDirection.ltr,
              ),
            ),
          ),
          const DemoItem(
            text: 'textDirection: TextDirection.rtl\n\n'
                'badgePosition: bottomStart',
            foregroundDecoration: RotatedCornerDecoration.withColor(
              color: Colors.indigo,
              badgeSize: Size(64, 64),
              badgePosition: BadgePosition.bottomStart,
              textDirection: TextDirection.rtl,
            ),
          ),
          const DemoItem(
            text: 'experimental feature:\nshow emoji',
            foregroundDecoration: RotatedCornerDecoration.withColor(
              color: Colors.purple,
              badgeSize: Size(64, 64),
              isEmoji: true,
              textSpan: TextSpan(
                text: '🤮',
                style: TextStyle(fontSize: 20, height: 1.7),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Color _generator(int h) {
    return HSLColor.fromAHSL(1, h.toDouble(), 1, 0.5).toColor();
  }
}
