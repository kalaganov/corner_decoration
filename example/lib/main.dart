import 'package:flutter/material.dart';

import 'demo_grid.dart';

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

class DisableOverScroll extends ScrollBehavior {
  const DisableOverScroll();

  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) => child;
}
