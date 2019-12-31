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
      // TODO: Experiment with other widthFactor vls - like 0.5 and 0.6
      widthFactor: 0.55,
      heightFactor: 0.13,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: color ??
              themeBasedColor(
                context,
                PaletteColor.primaryColor,
              ), // Experiment with random color values (I think it looks cool)
        ),
      ),
    );
  }
}
