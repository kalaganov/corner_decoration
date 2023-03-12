import 'package:flutter/material.dart';

class DemoItem extends StatelessWidget {
  final Decoration? foregroundDecoration;
  final Decoration? decoration;
  final String text;

  const DemoItem({
    this.foregroundDecoration,
    this.decoration,
    this.text = '',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        padding: const EdgeInsets.all(8),
        foregroundDecoration: foregroundDecoration,
        decoration: decoration,
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
