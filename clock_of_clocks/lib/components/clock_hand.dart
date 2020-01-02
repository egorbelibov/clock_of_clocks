import 'package:flutter/widgets.dart';

import '../styles/colors.dart';

class ClockHand extends StatelessWidget {
  final int id;
  final Color color;
  final double angle;

  ClockHand({
    @required this.id,
    @required this.angle,
    this.color,
  }) : assert(angle != null);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.55,
      heightFactor: 0.13,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: color ?? themeBasedColor(context, PaletteColor.primaryColor),
        ),
      ),
    );
  }
}
