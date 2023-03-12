## Pay attention!
###### If you need a regular (not rotated) text at the corner of widgets please consider to use Stack with Containers and Text widgets.
###### This package was developed to provide auto rotation of TextSpans.

## Example

Take a look at the provided [example application](https://github.com/kalaganov/corner_decoration/tree/master/example) for how to use the CornerDecoration.

## How to use

![screenshot1678647469887](https://user-images.githubusercontent.com/13645580/224568825-764b51d5-ea83-4b35-b6e0-8718074b4960.png)
```dart
Container(
  foregroundDecoration: RotatedCornerDecoration.withColor(
    color: Color(0xffffd700),
    badgeSize: Size(16, 16),
  ),
),
```
--------

![screenshot1678647470825](https://user-images.githubusercontent.com/13645580/224568830-f6e15c91-67a6-4a1d-b0bb-85c243be67ca.png)
```dart
Container(
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
```
--------

![screenshot1678647471437](https://user-images.githubusercontent.com/13645580/224568832-2c8975c2-0196-4cd1-88af-79d7e5747ba8.png)
```dart
Container(
  foregroundDecoration: RotatedCornerDecoration.withColor(
    color: Colors.blue,
    badgeSize: Size(64, 64),
    textSpan: TextSpan(
      text: 'Multiline\nbadge',
      style: TextStyle(fontSize: 10),
    ),
  ),
),
```
--------

![screenshot1678647472293](https://user-images.githubusercontent.com/13645580/224568838-a267ac54-edf8-4fd1-99ef-22ef3c447ef0.png)
```dart
Container(
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
```
--------

![screenshot1678647473029](https://user-images.githubusercontent.com/13645580/224568842-c2f2a60b-6950-49ce-baee-52d7afc7435b.png)
```dart
Container(
  foregroundDecoration: RotatedCornerDecoration.withColor(
    color: Colors.brown,
    badgeSize: Size(112, 56),
    textSpan: TextSpan(
      text: 'WEIRD BADGE',
      style: TextStyle(fontSize: 10),
    ),
  ),
),
```
--------

![screenshot1678647473739](https://user-images.githubusercontent.com/13645580/224568848-b7417ce4-31d2-4772-8fe3-b2d2db45991b.png)
```dart
Container(
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
```
--------

![screenshot1678647478380](https://user-images.githubusercontent.com/13645580/224568861-bfe7db47-6f59-4437-933b-14684805905d.png)
```dart
Container(
  foregroundDecoration: RotatedCornerDecoration.withColor(
    color: Colors.green,
    badgeSize: Size(64, 64),
    textSpan: TextSpan(
      text: 'SHIFT 1',
      style: TextStyle(fontSize: 10, backgroundColor: Colors.black),
    ),
  ),
),
```
--------

![screenshot1678647479092](https://user-images.githubusercontent.com/13645580/224568868-dbcc3300-5e36-44ca-bd14-4a5c92f7eb97.png)
```dart
Container(
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
```
--------

![screenshot1678647479917](https://user-images.githubusercontent.com/13645580/224568875-ace801b2-411b-443a-8b30-e322fb1cfd65.png)
```dart
Container(
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
```
--------
![screenshot1678647480605](https://user-images.githubusercontent.com/13645580/224568880-d891f3c3-1241-468c-8205-c4873672efd3.png)
```dart
Container(
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
```
--------

![screenshot1678647483564](https://user-images.githubusercontent.com/13645580/224570206-f4f1c43f-daaf-40a2-9d02-5fa9e9789033.png)
```dart
Container(
  foregroundDecoration: RotatedCornerDecoration.withColor(
    color: Colors.lightBlue,
    badgeSize: Size(64, 64),
    badgeShadow: BadgeShadow(color: Colors.black, elevation: 4),
  ),
),
```
--------

![screenshot1678647484300](https://user-images.githubusercontent.com/13645580/224568888-5e1a60b3-0eb4-4adf-baf0-2f799a9cb6a5.png)
```dart
Container(
  foregroundDecoration: RotatedCornerDecoration.withColor(
    color: Colors.indigo,
    badgeSize: Size(64, 64),
    badgePosition: BadgePosition.bottomStart,
    textDirection: TextDirection.ltr,
  ),
),
```
--------

![screenshot1678647485147](https://user-images.githubusercontent.com/13645580/224568896-ecf84a0c-51e4-462e-8c7f-05782f5a2512.png)
```dart
Container(
  foregroundDecoration: RotatedCornerDecoration.withColor(
    color: Colors.indigo,
    badgeSize: Size(64, 64),
    badgePosition: BadgePosition.bottomStart,
    textDirection: TextDirection.rtl,
  ),
),
```
--------

EXPERIMENTAL FEATURE!

use `isEmoji: true` to disable span rotating  
you can shift span position with `spanHorizontalOffset` and `TextStyle.height` parameters
![screenshot1678649657350](https://user-images.githubusercontent.com/13645580/224568902-7cce007b-cae2-45bb-ab0e-07efbaa0541e.png)
```dart
Container(
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
```
