import 'package:flutter/material.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xfff0f0f0),
        body: ScrollConfiguration(
          behavior: const DisableOverScroll(),
          child: SafeArea(child: DemoGrid()),
        ),
      ),
    );
  }
}

class DemoGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
      crossAxisCount: 3,
      children: <Widget>[
        Card(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: const Text('Apply badge colors and font styles'),
            foregroundDecoration: const RotatedCornerDecoration(
              color: Colors.blueGrey,
              geometry: const BadgeGeometry(width: 48, height: 48),
              textSpan: const TextSpan(
                text: 'OMG',
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 1,
                  fontWeight: FontWeight.bold,
                  shadows: [BoxShadow(color: Colors.yellowAccent, blurRadius: 4)],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4),
          child: Material(
            elevation: 1,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
//              boxShadow: [BoxShadow(color: Colors.black26)],
              ),
              child: const Text('cornerRadius=0', style: TextStyle(fontSize: 12)),
              foregroundDecoration: const RotatedCornerDecoration(
                color: Colors.redAccent,
                geometry: const BadgeGeometry(width: 30, height: 30, cornerRadius: 0),
              ),
            ),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: const Text('cornerRadius=16', style: TextStyle(fontSize: 12)),
            foregroundDecoration: const RotatedCornerDecoration(
              color: Colors.redAccent,
              geometry: const BadgeGeometry(width: 32, height: 32, cornerRadius: 16),
            ),
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.bottomLeft,
            foregroundDecoration: const RotatedCornerDecoration(
              color: Colors.green,
              geometry: const BadgeGeometry(width: 90, height: 90),
              textSpan: const TextSpan(
                text: 'DEFAULT',
                style: TextStyle(fontSize: 10, backgroundColor: Colors.black),
              ),
            ),
            child: const Text('By default baselineShift=1'),
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.bottomLeft,
            foregroundDecoration: const RotatedCornerDecoration(
              color: Colors.green,
              geometry: const BadgeGeometry(width: 90, height: 90),
              textSpan: const TextSpan(
                text: 'BASELINE SHIFT 0',
                style: TextStyle(fontSize: 10, backgroundColor: Colors.black),
              ),
              labelInsets: const LabelInsets(baselineShift: 0),
            ),
            child: const Text('But it can be changed'),
          ),
        ),
        Card(
          child: Container(
            foregroundDecoration: const RotatedCornerDecoration(
              color: Colors.green,
              geometry: const BadgeGeometry(width: 90, height: 90),
              textSpan: const TextSpan(
                text: 'BASELINE SHIFT 3',
                style: TextStyle(fontSize: 10, backgroundColor: Colors.black),
              ),
              labelInsets: const LabelInsets(baselineShift: 3),
            ),
          ),
        ),
        Card(
          child: Container(
            foregroundDecoration: const RotatedCornerDecoration(
              color: Colors.blue,
              geometry: const BadgeGeometry(width: 64, height: 64),
              textSpan: const TextSpan(
                text: 'Multiline\nbadge',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: const Text('Just empty badge on foreground', style: TextStyle(fontSize: 12)),
            foregroundDecoration: const RotatedCornerDecoration(
              color: Colors.purpleAccent,
              geometry: const BadgeGeometry(width: 48, height: 48),
            ),
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: const Text('Just empty badge on background', style: TextStyle(fontSize: 12)),
            decoration: const RotatedCornerDecoration(
              color: Colors.orange,
              geometry: const BadgeGeometry(width: 48, height: 48),
            ),
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.bottomLeft,
            child: const Text('Text Span Example'),
            foregroundDecoration: const RotatedCornerDecoration(
              color: Colors.black87,
              geometry: const BadgeGeometry(width: 64, height: 64),
              textSpan: const TextSpan(
                children: [
                  TextSpan(
                    text: 'LOREM\n',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.redAccent),
                  ),
                  TextSpan(
                    text: 'IPSUM',
                    style: TextStyle(fontSize: 7, fontStyle: FontStyle.italic, letterSpacing: 5, color: Colors.yellow),
                  ),
                ],
              ),
              labelInsets: const LabelInsets(baselineShift: 2),
            ),
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.bottomLeft,
            foregroundDecoration: const RotatedCornerDecoration(
              color: Colors.brown,
              geometry: const BadgeGeometry(width: 120, height: 50),
              textSpan: const TextSpan(
                text: 'WEIRD BADGE',
                style: TextStyle(fontSize: 10),
              ),
            ),
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Extra space before text OR after.\nNot both!\n\nlabel inset start=8',
              style: TextStyle(fontSize: 12),
            ),
            foregroundDecoration: const RotatedCornerDecoration(
              color: Colors.blueGrey,
              geometry: const BadgeGeometry(width: 48, height: 48),
              textSpan: const TextSpan(text: 'WOW', style: TextStyle(fontSize: 10)),
              labelInsets: const LabelInsets(start: 8),
            ),
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.bottomLeft,
            child: const Text('Apply any gradients instead of colors '),
            foregroundDecoration: const RotatedCornerDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [0, 0.6],
                colors: [Colors.blue, Colors.greenAccent],
              ),
              geometry: const BadgeGeometry(width: 48, height: 48),
              labelInsets: const LabelInsets(baselineShift: 2),
            ),
          ),
        ),
        Card(
          child: Container(
            foregroundDecoration: const RotatedCornerDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [Colors.purpleAccent, Colors.blue],
              ),
              geometry: const BadgeGeometry(width: 48, height: 48),
            ),
          ),
        ),
        Card(
          child: Container(
            foregroundDecoration: RotatedCornerDecoration(
              gradient: RadialGradient(
                center: Alignment.topRight,
                radius: 1.5,
                stops: [0.1, 0.5],
                colors: [Colors.redAccent, Colors.redAccent.withAlpha(0)],
              ),
              geometry: const BadgeGeometry(width: 48, height: 48),
            ),
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.bottomLeft,
            child: const Text('Add shadow with color and elevation'),
            foregroundDecoration: const RotatedCornerDecoration(
                color: Colors.yellow,
                geometry: const BadgeGeometry(width: 48, height: 48),
                badgeShadow: const BadgeShadow(color: Colors.black87, elevation: 1.5)),
          ),
        ),
        Card(
          child: Container(
            padding: const EdgeInsets.all(12),
            alignment: Alignment.bottomRight,
            child: const Text('Apply badge alignment', textAlign: TextAlign.end),
            foregroundDecoration: const RotatedCornerDecoration(
              color: Colors.teal,
              geometry: const BadgeGeometry(width: 48, height: 48, alignment: BadgeAlignment.bottomLeft),
              textSpan: TextSpan(text: 'o, rly?', style: TextStyle(fontSize: 10, letterSpacing: 0.5)),
              labelInsets: LabelInsets(baselineShift: 3),
            ),
          ),
        ),
        Card(
          child: Container(
            foregroundDecoration: const RotatedCornerDecoration(
              color: Colors.lightGreen,
              geometry: const BadgeGeometry(width: 48, height: 48, alignment: BadgeAlignment.bottomRight),
              textSpan: TextSpan(text: 'WHY?', style: TextStyle(fontSize: 12)),
              labelInsets: LabelInsets(baselineShift: 3, start: 1),
            ),
          ),
        ),
        Card(
          child: Container(
            foregroundDecoration: const RotatedCornerDecoration(
              color: Colors.pinkAccent,
              geometry: const BadgeGeometry(width: 48, height: 48, alignment: BadgeAlignment.topLeft),
              textSpan: TextSpan(text: 'OK', style: TextStyle(fontSize: 12)),
              labelInsets: LabelInsets(baselineShift: 3, start: 1),
            ),
          ),
        ),
      ],
    );
  }
}

class DisableOverScroll extends ScrollBehavior {
  const DisableOverScroll();

  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) => child;
}
