import 'package:flutter/widgets.dart';

import '../styles/colors.dart';

class ClockHand extends StatelessWidget {
  final Color color;
  final double angle;

  ClockHand({
    this.color,
    @required this.angle,
  }) : assert(angle != null);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor:
          0.55, // TODO: Experiment with other values - like 0.5 and 0.6
      heightFactor: 0.12,
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
