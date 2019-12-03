import 'package:flutter/material.dart';
import 'dart:math' as math;

class ClockMesh extends StatefulWidget {
  @override
  _ClockMeshState createState() => _ClockMeshState();
}

class _ClockMeshState extends State<ClockMesh> {
  static double _deviceWidth;
  static double _deviceHeight;

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    print(_deviceWidth);
    print(_deviceHeight);

    return Center(
      child: Container(
        width: 525,
        height: 280,
        color: Colors.black,
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisCount: 8,
          children: renderSquares(),
        ),
      ),
    );
  }

  List<Widget> renderSquares() {
    var widgetList = <Widget>[];
    for (var i = 0; i < 120; i++) {
      widgetList.add(
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                .withOpacity(1.0),
          ),
        ),
      );
    }
    return widgetList;
  }
}
