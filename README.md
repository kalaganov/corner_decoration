## Pay attention!
**If you need a regular (not rotated) text at the corner of widgets please consider to use Stack with Containers and Text widgets.
This package was developed to provide auto rotation of TextSpans. **

## Example

Take a look at the provided [example application](https://github.com/kalaganov/corner_decoration/tree/master/example) for how to use the CornerDecoration.

## How to use
![demo_badges01](https://user-images.githubusercontent.com/13645580/64600031-212a1400-d3c3-11e9-82d3-8cc985c97f0f.png)
```dart
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
```
--------
![demo_badges02](https://user-images.githubusercontent.com/13645580/64600032-212a1400-d3c3-11e9-8bc2-56a01601356d.png)
```dart
Padding(
  padding: const EdgeInsets.all(4),
  child: Material(
    elevation: 1,
    child: Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black26)],
      ),
      child: const Text('cornerRadius=0', style: TextStyle(fontSize: 12)),
      foregroundDecoration: const RotatedCornerDecoration(
        color: Colors.redAccent,
        geometry: const BadgeGeometry(width: 30, height: 30, cornerRadius: 0),
      ),
    ),
  ),
),
```
--------
![demo_badges03](https://user-images.githubusercontent.com/13645580/64600033-212a1400-d3c3-11e9-9f86-4dbbb0b113fe.png)
```dart
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
```
--------
![demo_badges04](https://user-images.githubusercontent.com/13645580/64600034-21c2aa80-d3c3-11e9-9f46-935d484ffb04.png)
```dart
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
```
--------
![demo_badges05](https://user-images.githubusercontent.com/13645580/64600036-21c2aa80-d3c3-11e9-9957-07b2d1954fc0.png)
```dart
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
```
--------
![demo_badges06](https://user-images.githubusercontent.com/13645580/64600037-21c2aa80-d3c3-11e9-9dac-91c2275a50d7.png)
```dart
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
```
--------
![demo_badges07](https://user-images.githubusercontent.com/13645580/64600038-21c2aa80-d3c3-11e9-9730-3bb211d21310.png)
```dart
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
```
--------
![demo_badges08](https://user-images.githubusercontent.com/13645580/64600039-21c2aa80-d3c3-11e9-949c-a71ace9f31c4.png)
```dart
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
```
--------
![demo_badges09](https://user-images.githubusercontent.com/13645580/64600040-225b4100-d3c3-11e9-8f65-154f1e0d76e8.png)
```dart
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
```
--------
![demo_badges10](https://user-images.githubusercontent.com/13645580/64600041-225b4100-d3c3-11e9-86a2-cef70a851e36.png)
```dart
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
```
--------
![demo_badges11](https://user-images.githubusercontent.com/13645580/64600043-225b4100-d3c3-11e9-96ee-e074e6ccf2c3.png)
```dart
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
```
--------
![demo_badges12](https://user-images.githubusercontent.com/13645580/64600044-225b4100-d3c3-11e9-9475-fc657f191ae8.png)
```dart
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
```
--------
![demo_badges13](https://user-images.githubusercontent.com/13645580/64600046-22f3d780-d3c3-11e9-9f4f-0cdb7922c6fa.png)
```dart
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
```
--------
![demo_badges14](https://user-images.githubusercontent.com/13645580/64600047-22f3d780-d3c3-11e9-9ee7-e9d7e111b451.png)
```dart
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
```
--------
![demo_badges15](https://user-images.githubusercontent.com/13645580/64600026-1ff8e700-d3c3-11e9-9860-fc8224d98802.png)
```dart
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
```
--------
![demo_badges16](https://user-images.githubusercontent.com/13645580/64600027-20917d80-d3c3-11e9-9cc2-18686e29468f.png)
```dart
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
```
--------
![demo_badges17](https://user-images.githubusercontent.com/13645580/64600028-20917d80-d3c3-11e9-8fd6-94cb261bf524.png)
```dart
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
```
--------
![demo_badges18](https://user-images.githubusercontent.com/13645580/64600029-20917d80-d3c3-11e9-91e6-cceaf1aa4513.png)
```dart
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
```
--------
![demo_badges19](https://user-images.githubusercontent.com/13645580/64600030-20917d80-d3c3-11e9-84a8-7bd89b0ea9b8.png)
```dart
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
```
